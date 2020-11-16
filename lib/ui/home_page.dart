
import 'package:flutter/material.dart';
import 'package:stackcash/blocs/wheel/games.dart';
import 'package:stackcash/blocs/wheel/wheel/wheel_page.dart';
// import 'package:stackcash/blocs/wheel/wheel_timer/wheel_timer.dart';
import 'package:stackcash/blocs/transactions/posts/view/posts_page.dart';


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.yellowAccent,
      body:Container(
        // color: Colors.yellowAccent,
        child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              color: Color(0xffFF99DD),
              child: InkWell(
                  child: Center(child: Text('How to play')),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BRoulette()),
                    );
                  }),
            ),
          ),
         Expanded(
            child: Container(
              color: Color(0xffFE9D2),
              child: InkWell(
                  child: Center(child: Text('Transaction History')),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PostsPage()),
                    );
                  }),
            ),
          ),
          Expanded(
            child: Container(
              color: Color(0xffFDC3FF),
              child: InkWell(
                  child: Center(child: Text('Black or Red')),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>WheelPage()),// GRoulette()),  
                    );
                  }),
            ),
          ),
        ],
      ),
      )
    );
  }

  Widget buildNavigationButton({String text, Function onPressedFn}) {
    return FlatButton(
      color: Color.fromRGBO(255, 255, 255, 0.3),
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      onPressed: onPressedFn,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 18.0),
      ),
    );
  }
}
