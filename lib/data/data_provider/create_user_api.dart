

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stackcash/data/models/api_user_models.dart';

  // int username;
  // int marketinstant;
  // int marketselection;
  // String amount;


Future<Stake>placeStake() async{ //int userName,int marketinstant,int marketselection,String amount
  final int userName = 1;
  final int marketinstant =19;
  final int marketselection = 2;
  final String amount = '500.00';


  final http.Response response = await http.post(
    'http://10.0.2.2:8000/api/stake/',
    headers: <String,String>{
      'Content-Type': 'application/json;charset=UTF-8',

    },

    body: jsonEncode(<String,dynamic>{
      'user_stake':userName,
      'marketinstant': marketinstant,
      'marketselection':marketselection,
      'amount': amount,
    }),

  );
  if (response.statusCode==201){
    
    return Stake.fromJson(json.decode(response.body));

  } else{
    print('STAKE ERR${response.body}');
    throw Exception('${response.body}' );  


  }


}


























// class SignUpApi{

//   post()async {

//     Future<Stake>  placeStake = http.post('http://10.0.2.2:8000/api/user');
//     // return rawUserData;

//   }
// }


class UserDataProvider{

  String baseUrl ='http://10.0.2.2:8000/api/account/';
  final successCode =200;
  Future<Account>getAcountBalance(String userId)async {
    final response = await http.get("$baseUrl+userId");
    final responsestring =jsonDecode(response.body );
    if (response.statusCode ==successCode ){
      return Account.fromJson(responsestring);
    
    } else {
      throw Exception('failed to get balance');
    }
    
  }

}


// Future<Stake>signUp(int marketselection,String amount) async{
//   // int username,int marketinstant,int marketselection,
//   final int username = 1;
//   final int marketinstant = 10;


//   final http.Response response = await http.post(
//     'http://10.0.2.2:8000/api/stake/',
//     headers: <String,String>{
//       'Content-Type': 'application/json;charset=UTF-8',

//     },

//     body: jsonEncode(<String,dynamic>{
//       'username':username,
//       'marketinstant':marketinstant,
//       'marketselection': marketselection,
//       'amount':amount,
//     }),

//   );
//   if (response.statusCode==201){
    
//     return Stake.fromJson(json.decode(response.body));

//   } else{
//     throw Exception('${response.body}' );  

//   }


// }
