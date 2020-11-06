import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:stackcash/blocs/log_in/repository/user_repository.dart';
// import 'package:stackcash/blocs/log_in/bloc/authentication_bloc.dart';
// import 'package:stackcash/blocs/log_in/login/bloc/login_bloc.dart';

import 'package:stackcash/blocs/wheel/wheel/bloc/wheel_bloc.dart';
// import 'package:stackcash/blocs/log_in/login/login_form.dart';
// import 'package:stackcash/blocs/wheel/wheel/wheel_form.dart';



import 'dart:async';
import 'dart:math';


import 'package:stackcash/blocs/wheel/spinningwheel/flutter_spinning_wheel.dart';
// import 'package:stackcash/blocs/wheel/wheel_timer/wheel_timer.dart';




class WheelPage extends StatelessWidget {
  // final UserRepository userRepository;

  WheelPage({Key key})
      :super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wheel | StackPesa'),//stackit // stackcash/stackpesa// gstacks   stackcash
      ),
      body: BlocProvider(
        create: (context) {
          return WheelBloc();
        },
        child:GRoulette(),//WheelForm(),
      ),
    );
  }
}





class GRoulette extends StatelessWidget {
  final StreamController _dividerController = StreamController<int>();

  final StreamController _wheelNotifier = StreamController<double>();

  // Stream<int> tick({int ticks}) {
  //     return Stream.periodic(Duration(seconds: 1), (x) => ticks - x - 1)
  //         .take(ticks);
  //   }

  dispose() {
    _dividerController.close();
    _wheelNotifier.close();
  }

Widget gibeonWheel(){

  // _wheelNotifier.sink.add(_generateRandomVelocity());

  return SpinningWheel(

                Image.asset('assets/images/roulette-8-300.png'),
                width: 210,
                height: 210,
                initialSpinAngle:_generateRandomAngle(),
                spinResistance: 0.4,
                canInteractWhileSpinning: false,
                dividers: 8,
                onUpdate: _dividerController.add,
                onEnd: _dividerController.add,
                secondaryImage:
                    Image.asset('assets/images/gif_.gif'),
                secondaryImageHeight: 218,
                secondaryImageWidth: 218,
                shouldStartOrStop: _wheelNotifier.stream,
              );
}
  @override
  Widget build(BuildContext context) {

    // _wheelNotifier.sink.add(_generateRandomVelocity());

    return BlocListener<WheelBloc, WheelState>(
      listener: (context, state) {
        if (state is WheelSpinning) {
          print('VELOOOOOO${state.velocity}');
          _wheelNotifier.sink.add(state.velocity);

          // Scaffold.of(context).showSnackBar(SnackBar(
          //   content: Text('${state.error}'),
          //   backgroundColor: Colors.red,
          // ));
        }
      },
      child: BlocBuilder<WheelBloc, WheelState>(
        builder: (context, state) {
          return Container(
            color: Colors.lightBlueAccent ,
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 112,),
                    Expanded(
                      child: gibeonWheel()
                      ),
 
                    Container(
                      // width: MediaQuery.of(context).size.width * 0.85,
                      // height: MediaQuery.of(context).size.width * 0.12,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Column(
                          children: <Widget>[
                            
                            RaisedButton(
                          onPressed: (){
                            //state is! WheelLoading
                              //?
                               BlocProvider.of<WheelBloc>(context).add(WheelButtonPressed());
                              //: null,
                              },
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
           
          );
        },
      ),
    );
























    
    
    
    // Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Expanded(
    //           child: gibeonWheel()
    //           ),
     
    //         WheelTimer(),
            // new RaisedButton(
            //   child: new Text("Start"),
            //   onPressed: () =>
            //       _wheelNotifier.sink.add(_generateRandomVelocity()),
            // )
          // ],
       
    
      
    // );
  }
  
  double _generateRandomVelocity() {
    double  veloc = (Random().nextDouble() * 6000) + 2000;
    print('VELO$veloc');
    return veloc;
    }

  double _generateRandomAngle() => Random().nextDouble() * pi * 2;
}



class GRouletteScore extends StatelessWidget {
  final int selected;

  final Map<int, String> labels = {
    1: 'RED-1\$',
    2: 'WHITE-1\$',
    3: 'RED-2\$',
    4: 'WHITE-2\$',
    5: 'RED-3\$',
    6: 'WHITE-3\$',
    7: 'RED-4\$',
    8: 'WHITE-4\$',

  };

  GRouletteScore(this.selected);

  @override
  Widget build(BuildContext context) {
    return Text('${labels[selected]}',
        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 24.0));
  }
}