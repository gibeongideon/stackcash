import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackcash/blocs/log_in/login/bloc/login_bloc.dart';
// import 'package:stackcash/blocs/log_in/bloc/authentication_bloc.dart';
import 'package:stackcash/blocs/sign_up/signuppage.dart';
import 'package:stackcash/ui/const/color_const.dart';
import 'package:stackcash/ui/const/gradient_const.dart';
import 'package:stackcash/ui/const/images_const.dart';
import 'package:stackcash/ui/const/size_const.dart';
import 'package:stackcash/ui/const/string_const.dart';
// import 'package:stackcash/ui/page/signup/widgets/signup_arrow_button.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState2 extends State<LoginForm> {
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
            height: double.infinity,
            width: double.infinity,
            // color: Colors.yellowAccent,
            decoration: BoxDecoration(
              gradient: SIGNIN_BACKGROUND),
            child: Form(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Container(child:Text('SPINCASH LOGO'),),
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

    final _media = MediaQuery.of(context).size;

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
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: SIGNIN_BACKGROUND,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50.0, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Image.asset(
                            SignUpImagePath.SignUpLogo,
                            height: _media.height / 7,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Welcome To StackPesa!",
                          style: TextStyle(
                            letterSpacing: 4,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            fontSize: TEXT_LARGE_SIZE,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Log in',
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w200,
                              fontSize: 40,
                              color: Colors.blue),
                        ),
                        Text(
                          'to continue.',
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w200,
                              fontSize: 30,
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: 20,
                        ),


                        Container(
                          // height: _media.height / 3.8,
                          decoration: BoxDecoration(
                            gradient: SIGNUP_CARD_BACKGROUND,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 15,
                                spreadRadius: 8,
                              ),
                            ],
                          ),
                          child:Form(
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  // Container(child:Text('SPINCASH LOGO'),),
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
                                  // Container(
                                  //   // width: MediaQuery.of(context).size.width * 0.55,
                                  //   // height: MediaQuery.of(context).size.width * 0.12,
                                  //   child: Padding(
                                  //     padding: EdgeInsets.only(top: 10.0),
                                  //     child: Column(
                                  //       children: <Widget>[

                                  //         Text('Don\'t have an account?'),//,style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),
                                  //     // ),
                                  //     RaisedButton(
                                  //       color: BLUE,
                                  //       onPressed: () {
                                  //         // BlocProvider.of<AuthenticationBloc>(context).add(SignUpButtonPressed());
                                  //         Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage()), );
                                  //       },
                                  //       child: Text(
                                  //         'Register Here',
                                  //         style: TextStyle(
                                  //           fontSize: 15.0,color: Colors.black45
                                  //         ),
                                  //       ),
                                  //       shape: StadiumBorder(
                                  //         side: BorderSide(
                                  //           color: Colors.yellow,
                                  //           width: 2,
                                  //         ),
                                  //       ),
                                  //     ),

                                  //       ],
                                  //     ), 
                                  //   ),
                                  // ),
                                  // // Container(
                                  // //   child: state is LoginLoading
                                  // //       ? CircularProgressIndicator()
                                  // //       : null,
                                  // // ),
                                ],
                              ),
                            ),
            ),
                          
                          
                          
                        ),
                      ],
                    ),
                  ),


                                  Container(
                                    // width: MediaQuery.of(context).size.width * 0.55,
                                    // height: MediaQuery.of(context).size.width * 0.12,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 5.0),
                                      child: Column(
                                        children: <Widget>[

                                          Text('Don\'t have an account?', style: TextStyle(
                                            fontSize: 15.0,color: Colors.blue)),//,style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),
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
                                            // width: 1,
                                          ),
                                        ),
                                      ),

                                        ],
                                      ), 
                                    ),
                                  ),
                                  // Container(
                                  //   child: state is LoginLoading
                                  //       ? CircularProgressIndicator()
                                  //       : null,
                                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: <Widget>[
                  //     Text(
                  //       StringConst.SIGN_UP_TEXT,
                  //       style: TextStyle(color: MAIN_COLOR),
                  //     ),
                  //     SizedBox(
                  //       width: 5,
                  //     ),
                  //     GestureDetector(
                  //       onTap: () => print("Sign Up Tapped"),
                  //       child: Text(StringConst.SIGN_UP),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 50,
                  // )
                ],
              ),
              // Positioned(
              //   bottom: _media.height / 6.3,
              //   right: 15,
              //   child: SignUpArrowButton(
              //     icon: IconData(0xe901, fontFamily: 'Icons'),
              //     iconSize: 9,
              //     onTap: () => print("Signup Tapped"),
              //   ),
              // ),
            ],
          ),
        )
        
        );
      },
    )
    );
  }

  Widget inputText(
    String fieldName,
    String hintText,
    TextEditingController controller,
    bool obSecure,
  ) {
    return TextField(
      style: TextStyle(height: 1.3),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: fieldName,
        labelStyle: TextStyle(
          fontSize: TEXT_NORMAL_SIZE,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w400,
          letterSpacing: 1,
          height: 0,
        ),
        border: InputBorder.none,
      ),
      obscureText: obSecure,
    );
  }
}




//WIDGET

class SignUpArrowButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  final double iconSize;
  final double height;
  final double width;
  final Color iconColor;

  SignUpArrowButton({
    this.icon,
    this.iconSize,
    this.onTap,
    this.height = 50.0,
    this.width = 50.0,
    this.iconColor = const Color(0xFFdbedb0),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 15,
                spreadRadius: 0,
                offset: Offset(0.0, 16.0)),
          ],
          gradient: LinearGradient(begin: FractionalOffset.centerLeft,
// Add one stop for each color. Stops should increase from 0 to 1
              stops: [
                0.2,
                1
              ], colors: [
            Color(0xff000000),
            Color(0xff434343),
          ]),
        ),
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}