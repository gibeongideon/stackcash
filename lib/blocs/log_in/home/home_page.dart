import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackcash/blocs/log_in/bloc/authentication_bloc.dart';
import 'package:stackcash/blocs/wheel/games.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
          appBar: AppBar(
            title: Text('StackPesa | Home Hub'),
            actions: <Widget>[
                Center(
                  child:BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context,state) {
                      return Text('${state.user.username}');
                     }
                     ) 

                ),
                
                RaisedButton(
                  color: Color(0xEF52A5F5),
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  onPressed: () {
                    BlocProvider.of<AuthenticationBloc>(context)
                        .add(LoggedOut());
                  },
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: Colors.red,
                      width: 1,
                    ),
                  ),
                ),
                
              ],
            ),
            body: Container(
              child: MyHomePage(),
            ),
          );
          // } 



      }
      



  }
