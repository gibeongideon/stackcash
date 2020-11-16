import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:flutter_infinite_list/posts/posts.dart';
import 'package:stackcash/blocs/transactions/posts/posts.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({@required this.httpClient}) : super(const PostState());

  final http.Client httpClient;

  @override
  Stream<Transition<PostEvent, PostState>> transformEvents(
    Stream<PostEvent> events,
    TransitionFunction<PostEvent, PostState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is PostFetched) {
      yield await _mapPostFetchedToState(state);
    }
  }

  Future<PostState> _mapPostFetchedToState(PostState state) async {
    if (state.hasReachedMax) return state;
    try {
      if (state.status == PostStatus.initial) {
        print(state.posts.length);
        final posts = await _fetchPosts(0, 10);
        return state.copyWith(
          status: PostStatus.success,
          posts: posts,
          hasReachedMax: false,
        );
      }
      final posts = await _fetchPosts(state.posts.length, 10);
      return posts.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: PostStatus.success,
              posts: List.of(state.posts)..addAll(posts),
              hasReachedMax: false,
            );
    } on Exception {
      return state.copyWith(status: PostStatus.failure);
    }
  }

  Future<List<Post>> _fetchPosts(int startIndex, int limit) async {

    final response = await httpClient.get(
      'http://10.0.2.2:8000/api/user_trans/_start=$startIndex&_limit=$limit/_user_id=1'
    );
    if (response.statusCode == 200) {
      final data = (json.decode(response.body) as List);//Reverse ensure last be first
      // final data =datat.reversed;
      return data.map((dynamic rawPost) {
        return Post(
          id: rawPost['id'] as int,
          title: rawPost['trans_type'] as String,
          body: rawPost['amount'] as String,
          transtype: rawPost['now_bal'] as String,
        );
      }).toList();
    }
    throw Exception('error fetching posts');
  }
}


    // {
    //     "id": 1,
    //     "amount": "4001.00",
    //     "trans_type": "Deposit to Account"
    // },