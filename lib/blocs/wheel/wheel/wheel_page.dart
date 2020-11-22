import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackcash/blocs/wheel/wheel/bloc/wheel_bloc.dart';
import 'package:stackcash/blocs/wheel/spinningwheel/flutter_spinning_wheel.dart';
import 'package:stackcash/ui/const/_const.dart';
import 'package:stackcash/ui/const/color_const.dart';
import 'package:stackcash/ui/const/gradient_const.dart';
// import 'package:stackcash/ui/const/images_const.dart';
// import 'package:stackcash/ui/const/size_const.dart';
// import 'package:stackcash/ui/const/string_const.dart';
import './select_button.dart';



class WheelPage extends StatelessWidget {
  // final UserRepository userRepository;

  WheelPage({Key key})
      :super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: YELLOW,
        title: Text('Wheel | StackPesa',style: TextStyle( color:Colors.red, fontSize: 20.0)),//stackit // stackcash/stackpesa// gstacks   stackcash
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
                width: 250,
                height: 250,
                initialSpinAngle:_generateRandomAngle(),
                spinResistance: 0.3,
                canInteractWhileSpinning: false,
                dividers: 8,
                onUpdate: _dividerController.add,
                onEnd: _dividerController.add,
                secondaryImage:
                    Image.asset('assets/images/gif_.gif'),
                secondaryImageHeight: 255,
                secondaryImageWidth: 255, 
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
            decoration: BoxDecoration(
              gradient: WHEEL_BACKGROUND,),
            
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 25,),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          gibeonWheel(),
                          SizedBox(height: 25,),
                          StreamBuilder(

                            stream: _dividerController.stream,
                            builder: (context, snapshot) =>snapshot.hasData 
                            ? GRouletteScore(snapshot.data) 
                            : Container(),
                            ),
                            SizedBox(width:10,
                            height:10),
                            BetButton(),


                        ]
                      ),
                      
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
                    Container(),
                    //   child: state is WheelLoading
                    //       ? CircularProgressIndicator()
                    //       : null,
                    // ),
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
  
  // double _generateRandomVelocity() {
  //   double  veloc = (Random().nextDouble() * 6000) + 2000;
  //   print('VELO$veloc');
  //   return veloc;
  //   }

  double _generateRandomAngle() => Random().nextDouble() * pi * 2;
}



class GRouletteScore extends StatelessWidget {
  final int selected;

  final Map<int, String> labels = {
    1: 'RED   10',
    2: 'WHITE 10',
    3: 'RED   20',
    4: 'WHITE 20',
    5: 'RED   30',
    6: 'WHITE 30',
    7: 'RED   40',
    8: 'WHITE 40',

  };

  GRouletteScore(this.selected);

  // ignore: missing_return
  Widget status(){
    if (labels[selected].toString().contains('RED')) {
      return Container(
        width:45,
        height:45,
        color: Colors.red,
        child:Center(
          child:Text('${labels[selected].split("")[6]}'),
        )
      );
    } else if(labels[selected].toString().contains('WHITE')) {

    return Container(
      width:45,
      height:45,
      color:Colors.white,
      child:Center(
          child:Text('${labels[selected].split("")[6]}'),
        )
      );
     } //else{
    //   return Text('WOW');
    // }
  }


  @override
  Widget build(BuildContext context) {
    return status();
    // return Text('${labels[selected]}',
    //     style: TextStyle(fontStyle: FontStyle.italic, fontSize: 24.0));
  }
}






// class WRouletteScore extends StatelessWidget {
//   final int selected;

//   final Map<int, Widget> labels = {
//     1: 'RED-1\$',
//     2: 'WHITE-1\$',
//     3: 'RED-2\$',
//     4: 'WHITE-2\$',
//     5: 'RED-3\$',
//     6: 'WHITE-3\$',
//     7: 'RED-4\$',
//     8: 'WHITE-4\$',

//   };

//   WRouletteScore(this.selected);

//   @override
//   Widget build(BuildContext context) {
//     return Text('${labels[selected]}',
//         style: TextStyle(fontStyle: FontStyle.italic, fontSize: 24.0));
//   }
// }