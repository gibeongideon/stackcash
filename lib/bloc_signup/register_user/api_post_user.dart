import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './user_model.dart';




Future<UserRegister>placeStake(String userName,String password) async{
  final String email = 'MyEmail@gmail.com';

  final http.Response response = await http.post(
    'http://10.0.2.2:8000/api/user/',
    headers: <String,String>{
      'Content-Type': 'application/json;charset=UTF-8',

    },

    body: jsonEncode(<String,String>{
      'username':userName,
      'email': email,
      'password':password,
    }),

  );
  if (response.statusCode==201){
    return UserRegister.fromJson(json.decode(response.body));

  } else{
    throw Exception('Failed to create user');

  }


}



// {
//         "username": "User7",
//         "email": "gibeon2@gmail.com",
//         "password": "27837185gg"
//     }
