import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackcash/blocs/transactions/posts/posts.dart';
import 'package:http/http.dart' as http;
import 'package:stackcash/ui/const/_const.dart';

class PostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => PostBloc(httpClient: http.Client())..add(PostFetched()),
        child:    Scaffold(
      appBar: AppBar(title: const Text('Transactions'),backgroundColor: BLUE_DEEP),
      body:Container(
        child:Column(
          children: [
            Container(
              child:Row(
                children: [
                  Text('Bal:20000'),
                  Text('Withrawable Bal:20000'),

                  RaisedButton(
                    color: Colors.blue,
                    onPressed: null,
                    child: Text('Deposit'),
                    ),
                  RaisedButton(
                    onPressed: null,
                    child: Text('Withraw'),
                    )
                ],
              )
              
            ),
            Row(
              children: [
                Text('Trans_type'),
                Text('Amount'),
                Text('Time')
              ],),
            Expanded(
              child:PostPage()),
            
          ],),
      )

    ),
      
    );
    
    

  }


}

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PostsList();
  }
}
