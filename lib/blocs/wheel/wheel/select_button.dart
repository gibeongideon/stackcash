import 'package:flutter/material.dart';

class BetButton extends StatefulWidget{

  
  @override
  _BetButtonState createState() => _BetButtonState();
    
  }
  
  class _BetButtonState extends State<BetButton> {

  List<bool>isSelected =List.generate(2, (index) => false);
  
  @override
  Widget build(BuildContext context) {
    

    return ToggleButtons(
  children: <Widget>[
    Container(
      width:45,
      height:45,
      // color:Colors.red,
      child:Center(
          child:Text('R'),
        )
      ),
    Container(
      width:45,
      height:45,
      // color:Colors.white,
      child:Center(
          child:Text('W'),
        )
      ),


    // Icon(Icons.money),
    // Icon(Icons.call),
  ],
  onPressed: (int index) {
    setState(() {
      for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
        if (buttonIndex == index) {
          isSelected[buttonIndex] = true;
        } else {
          isSelected[buttonIndex] = false;
        }
      }
    });
  },
  isSelected: isSelected, //state.isSelected
  fillColor: Colors.green,
  // color: Colors.white,
  // selectedColor: Colors.blue,
  // disabledColor: Colors.black26,
  borderWidth: 20,
  // borderColor: Colors.black,
  // renderBorder: false,
);
  }
}
