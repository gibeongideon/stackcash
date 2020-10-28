import 'dart:async';
// import 'dart:ffi';
import 'dart:math';
// import 'package:bloc/bloc.dart';;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackcash/blocs/wheel/wheel_timer/bloc/timer_bloc.dart';
// import 'package:provider/provider.dart';
import 'spinningwheel/flutter_spinning_wheel.dart';
import 'package:stackcash/blocs/wheel/wheel_timer/wheel_timer.dart';



class Wheel extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<TimerBloc>(context),
      child: BRoulette(),
      );
  }
}



class BRoulette extends StatelessWidget {
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
                    Image.asset('assets/images/roulette-center-300.png'),
                secondaryImageHeight: 50,
                secondaryImageWidth: 50,
                shouldStartOrStop: _wheelNotifier.stream,
              );
}
  @override
  Widget build(BuildContext context) {

    // _wheelNotifier.sink.add(_generateRandomVelocity());

    return Scaffold(
      appBar: AppBar(title: const Text('StackPesa | Register'),
      backgroundColor: Color(0xffDDC3FF), elevation: 0.0),
      backgroundColor: Color(0xffDBC3FF),
      body:BlocConsumer(
        builder: (context,state){
          return gibeonWheel();
          
        },
        listener: (context,state){
          if (state is TimerRunInProgress){
            _wheelNotifier.sink.add(state.duration*100);//add  
          }


        }
        
        )
    
      
    );
  }
  
  // double _generateRandomVelocity() {
  //   double  veloc = (Random().nextDouble() * 6000) + 2000;
  //   print('VELO$veloc');
  //   return veloc;
  //   }

  double _generateRandomAngle() => Random().nextDouble() * pi * 2;
}



class BRouletteScore extends StatelessWidget {
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

  BRouletteScore(this.selected);

  @override
  Widget build(BuildContext context) {
    return Text('${labels[selected]}',
        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 24.0));
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

  _wheelNotifier.sink.add(_generateRandomVelocity());

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
                    Image.asset('assets/images/roulette-center-300.png'),
                secondaryImageHeight: 50,
                secondaryImageWidth: 50,
                shouldStartOrStop: _wheelNotifier.stream,
              );
}
  @override
  Widget build(BuildContext context) {

    // _wheelNotifier.sink.add(_generateRandomVelocity());

    return Scaffold(
      appBar: AppBar(title: const Text('StackPesa | Register'),
      backgroundColor: Color(0xffDDC3FF), elevation: 0.0),
      backgroundColor: Color(0xffDBC3FF),
      body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: gibeonWheel()
              ),
     
            WheelTimer(),
            // new RaisedButton(
            //   child: new Text("Start"),
            //   onPressed: () =>
            //       _wheelNotifier.sink.add(_generateRandomVelocity()),
            // )
          ],
        ),
    
      
    );
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

// final StreamController _wheelNotifier = StreamController<double>();

// class WheelState extends ChangeNotifier{

  

//   Future<Stream<double>>runwheel (Double val){
//     return _wheelNotifier.sink.add(val);
    



//   }




  
// }





























class Basic extends StatelessWidget {
  final StreamController _dividerController = StreamController<int>();

  dispose() {
    _dividerController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xffB0F9D2), elevation: 0.0),
      backgroundColor: Color(0xffB0F9D2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinningWheel(
              Image.asset('assets/images/wheel-6-300.png'),
              width: 310,
              height: 310,
              initialSpinAngle: _generateRandomAngle(),
              spinResistance: 0.2,
              dividers: 6,
              onUpdate: _dividerController.add,
              onEnd: _dividerController.add,
            ),
            StreamBuilder(
              stream: _dividerController.stream,
              builder: (context, snapshot) =>
                  snapshot.hasData ? BasicScore(snapshot.data) : Container(),
            )
          ],
        ),
      ),
    );
  }

  double _generateRandomAngle() => Random().nextDouble() * pi * 2;
}

class BasicScore extends StatelessWidget {
  final int selected;

  final Map<int, String> labels = {
    1: 'Purple',
    2: 'Magenta',
    3: 'Red',
    4: 'Dark Orange',
    5: 'Light Orange',
    6: 'Yellow',
  };

  BasicScore(this.selected);

  @override
  Widget build(BuildContext context) {
    return Text('${labels[selected]}',
        style: TextStyle(fontStyle: FontStyle.italic));
  }
}

class Roulette extends StatelessWidget {
  final StreamController _dividerController = StreamController<int>();

  final _wheelNotifier = StreamController<double>();

  dispose() {
    _dividerController.close();
    _wheelNotifier.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xffDDC3FF), elevation: 0.0),
      backgroundColor: Color(0xffBDC3FF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinningWheel(
              Image.asset('assets/images/roulette-8-300.png'),
              width: 310,
              height: 310,
              initialSpinAngle: _generateRandomAngle(),
              spinResistance: 0.6,
              canInteractWhileSpinning: false,
              dividers: 8,
              onUpdate: _dividerController.add,
              onEnd: _dividerController.add,
              secondaryImage:
                  Image.asset('assets/images/roulette-center-300.png'),
              secondaryImageHeight: 110,
              secondaryImageWidth: 110,
              shouldStartOrStop: _wheelNotifier.stream,
            ),
            SizedBox(height: 30),
            StreamBuilder(
              stream: _dividerController.stream,
              builder: (context, snapshot) =>
                  snapshot.hasData ? RouletteScore(snapshot.data) : Container(),
            ),
            SizedBox(height: 30),
            new RaisedButton(
              child: new Text("Start"),
              onPressed: () =>
                  _wheelNotifier.sink.add(_generateRandomVelocity()),
            )
          ],
        ),
      ),
    );
  }

  double _generateRandomVelocity() => (Random().nextDouble() * 6000) + 2000;

  double _generateRandomAngle() => Random().nextDouble() * pi * 2;
}

class RouletteScore extends StatelessWidget {
  final int selected;

  final Map<int, String> labels = {
    1: '1000\$',
    2: '400\$',
    3: '800\$',
    4: '7000\$',
    5: '5000\$',
    6: '300\$',
    7: '2000\$',
    8: '100\$',
  };

  RouletteScore(this.selected);

  @override
  Widget build(BuildContext context) {
    return Text('${labels[selected]}',
        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 24.0));
  }
}




// class _LuckyPath extends CustomClipper<Path>{

//   final double angle;

//   _LuckyPath(this.angle);

//   @override
//   Path getClip(Size size){
//     Path _path =Path();
//     Offset _center = size.center(Offset.zero);
//     Rect _rect = Rect.fromCircle(center:_center,radius:size.width/2);
//     _path.moveTo(_center.dx, _center.dy);
//     _path.arcTo(_rect, -pi/2-angle/2, angle, false);
//     _path.close();
//     return _path;
//   }

//   @override
//   bool shouldReclip(_LuckyPath oldClipper){
//     return angle !=oldClipper.angle;

//   }
  
// }



// class SpinX extends StatelessWidget {
//    var _rotate =_rotate(widget.items.insedOf(luck));
//    var _angle = 2* pi /widget.items.length;

  

//   @override
//   Widget build(BuildContext context) {
//     return 

//   }