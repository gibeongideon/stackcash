import 'package:flutter/material.dart';
import 'color_const.dart';

const LinearGradient SIGNIN_BACKGROUND = LinearGradient(
  begin: FractionalOffset(0.0, 0.4), end: FractionalOffset(0.9, 0.7),
  // Add one stop for each color. Stops should increase from 0 to 1
  stops: [0.1, 0.9], colors: [YELLOW ,RED],
);



const LinearGradient SIGNIN_BACKGROUND1 = LinearGradient(
  begin: FractionalOffset(0.0, 0.4), end: FractionalOffset(0.9, 0.7),
  // Add one stop for each color. Stops should increase from 0 to 1
  stops: [0.1, 0.9], colors: [Colors.white ,Colors.yellow],
);


const LinearGradient SIGNUP_BACKGROUND = LinearGradient(
  begin: FractionalOffset(0.0, 0.4), end: FractionalOffset(0.9, 0.7),
  // Add one stop for each color. Stops should increase from 0 to 1
  stops: [0.1, 0.9], colors: [YELLOW, Colors.blue],
);


const LinearGradient SIGNUP_CARD_BACKGROUND = LinearGradient(
  tileMode: TileMode.clamp,
  begin: FractionalOffset.centerLeft,
  end: FractionalOffset.centerRight,
  stops: [0.1, 1.0],
  colors: [SIGNUP_RED,YELLOW],
);


const LinearGradient SIGNUP_CARD_BACKGROUND1 = LinearGradient(
  tileMode: TileMode.clamp,
  begin: FractionalOffset.centerLeft,
  end: FractionalOffset.centerRight,
  stops: [0.1, 1.0],
  colors: [YELLOW,Colors.white],
);

const LinearGradient SIGNUP_CIRCLE_BUTTON_BACKGROUND = LinearGradient(
  tileMode: TileMode.clamp,
  begin: FractionalOffset.centerLeft,
  end: FractionalOffset.centerRight,
  // Add one stop for each color. Stops should increase from 0 to 1
  stops: [0.4, 1],
  colors: [Colors.black, Colors.black54],
);


const LinearGradient WHEEL_BACKGROUND = LinearGradient(
  // begin: FractionalOffset(0.1, 0.2), end: FractionalOffset(0.8, 0.5),
    begin: FractionalOffset(0.0, 0.4), end: FractionalOffset(0.9, 0.7),
  // Add one stop for each color. Stops should increase from 0 to 1
  stops: [0.2, 0.8], colors: [Colors.yellow, Colors.red],
);
