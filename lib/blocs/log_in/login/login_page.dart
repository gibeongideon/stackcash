import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackcash/blocs/log_in/repository/user_repository.dart';

import 'package:stackcash/blocs/log_in/bloc/authentication_bloc.dart';
import 'package:stackcash/blocs/log_in/login/bloc/login_bloc.dart';
import 'package:stackcash/blocs/log_in/login/login_form.dart';
import 'package:stackcash/ui/const/color_const.dart';


class LoginPage extends StatelessWidget {
  final UserRepository userRepository;

  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: YELLOW,
      
        title: Text('Login | StackPesa',style: TextStyle( color:Colors.deepPurpleAccent, fontSize: 20.0)),//stackit // stackcash/stackpesa// gstacks   stackcash
      ),
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child:LoginForm(),
      ),
    );
  }
}