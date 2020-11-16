import 'package:flutter/material.dart';
import 'package:stackcash/blocs/transactions/posts/posts.dart';
import 'package:stackcash/ui/const/gradient_const.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({Key key, @required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
      gradient: SIGNIN_BACKGROUND),

      child:Padding(
        padding: EdgeInsets.all(10),
        child:ListTile(

          leading: Text('${post.title}', style: textTheme.caption),

          title: Row(
            children:[Text('Amnt: ${post.body}'),Text(' Bal: ${post.transtype}')]
          ),
          isThreeLine: false,
          trailing: Text('${post.id}'),
          tileColor: Colors.yellow,
          // dense: true,
        )
    )
    );
  }
}

