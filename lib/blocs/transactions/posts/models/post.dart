import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Post extends Equatable {
  const Post({@required this.id, @required this.title, @required this.body,@required this.transtype});

  final int id;
  final String title;
  final String body;
  final String transtype;

  @override
  List<Object> get props => [id, title, body,transtype];
}


  //  {
  //       "id": 1,
  //       "amount": "4001.00",
  //       "trans_type": "Deposit to Account"
  //   }