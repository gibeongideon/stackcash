import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackcash/blocs/log_in/login/bloc/login_bloc.dart';
// import 'package:stackcash/blocs/log_in/bloc/authentication_bloc.dart';
import 'package:stackcash/blocs/sign_up/signuppage.dart';
import 'package:stackcash/ui/const/color_const.dart';
import 'package:stackcash/ui/const/gradient_const.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
        username: _usernameController.text,
        password: _passwordController.text,
      ));
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFaliure) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('${state.error}'),
            backgroundColor: Colors.red,
          ));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Container(
            // color: Colors.yellowAccent,
            decoration: BoxDecoration(
              gradient: SIGNUP_BACKGROUND),
            child: Form(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(child:Text('SPINCASH LOGO'),),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'mobile number', icon: Icon(Icons.phone)),
                      controller: _usernameController,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'password', icon: Icon(Icons.security)),
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    Container(
                      // width: MediaQuery.of(context).size.width * 0.85,
                      // height: MediaQuery.of(context).size.width * 0.12,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Column(
                          children: <Widget>[
                            RaisedButton(
                              color: BLUE,
                          onPressed: state is! LoginLoading
                              ? _onLoginButtonPressed
                              : null,
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18.0,color:Colors.blue
                            ),
                          ),
                          shape: StadiumBorder(
                            side: BorderSide(
                              color: Colors.yellow,
                              width: 2,
                            ),
                          ),
                        ),
                    
                          ],
                        ), 
                      ),
                    ),
                    Container(
                      // width: MediaQuery.of(context).size.width * 0.55,
                      // height: MediaQuery.of(context).size.width * 0.12,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Column(
                          children: <Widget>[

                            Text('Don\'t have an account?'),//,style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),
                        // ),
                        RaisedButton(
                          color: BLUE,
                          onPressed: () {
                            // BlocProvider.of<AuthenticationBloc>(context).add(SignUpButtonPressed());
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage()), );
                          },
                          child: Text(
                            'Register Here',
                            style: TextStyle(
                              fontSize: 15.0,color: Colors.black45
                            ),
                          ),
                          shape: StadiumBorder(
                            side: BorderSide(
                              color: Colors.yellow,
                              width: 2,
                            ),
                          ),
                        ),

                          ],
                        ), 
                      ),
                    ),
                    Container(
                      child: state is LoginLoading
                          ? CircularProgressIndicator()
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
