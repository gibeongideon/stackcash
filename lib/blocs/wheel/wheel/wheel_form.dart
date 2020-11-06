import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:stackcash/blocs/log_in/Wheel/bloc/Wheel_bloc.dart';
import 'package:stackcash/blocs/wheel/wheel/bloc/wheel_bloc.dart';
// import 'package:stackcash/blocs/log_in/bloc/authentication_bloc.dart';
// import 'package:stackcash/blocs/sign_up/signuppage.dart';

class WheelForm extends StatefulWidget {
  @override
  State<WheelForm> createState() => _WheelFormState();
}

class _WheelFormState extends State<WheelForm> {
  // final _usernameController = TextEditingController();
  // final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onWheelButtonPressed() {
      BlocProvider.of<WheelBloc>(context).add(WheelButtonPressed());
    }

    return BlocListener<WheelBloc, WheelState>(
      listener: (context, state) {
        if (state is WheelFaliure) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('${state.error}'),
            backgroundColor: Colors.red,
          ));
        }
      },
      child: BlocBuilder<WheelBloc, WheelState>(
        builder: (context, state) {
          return Container(
            color: Colors.lightBlueAccent ,
            child: Form(
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
 
                    Container(
                      // width: MediaQuery.of(context).size.width * 0.85,
                      // height: MediaQuery.of(context).size.width * 0.12,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Column(
                          children: <Widget>[
                            RaisedButton(
                          onPressed: state is! WheelLoading
                              ? _onWheelButtonPressed
                              : null,
                          child: Text(
                            'Wheel',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          shape: StadiumBorder(
                            side: BorderSide(
                              color: Colors.blue,
                              width: 1,
                            ),
                          ),
                        ),
                    
                          ],
                        ), 
                      ),
                    ),
                    Container(
                      child: state is WheelLoading
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
