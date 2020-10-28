
import 'package:flutter/material.dart';
import 'package:stackcash/blocs/wheel/games.dart';


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              color: Color(0xffDDC3FF),
              child: InkWell(
                  child: Center(child: Text('How to play')),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Wheel()),
                    );
                  }),
            ),
          ),
         Expanded(
            child: Container(
              color: Color(0xffFE9D2),
              child: InkWell(
                  child: Center(child: Text('Invite Friend games')),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Roulette()),
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
                      MaterialPageRoute(builder: (context) => GRoulette()),  
                    );
                  }),
            ),
          ),
        ],
      ),
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
