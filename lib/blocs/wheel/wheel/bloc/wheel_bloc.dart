import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:stackcash/data/data_provider/create_user_api.dart';

// import 'package:stackcash/blocs/log_in/bloc/authentication_bloc.dart';
// import 'package:stackcash/blocs/log_in/repository/user_repository.dart';


part 'wheel_event.dart';
part 'wheel_state.dart';

class WheelBloc extends Bloc<WheelEvent, WheelState> {
  // final UserRepository userRepository;
  // final AuthenticationBloc authenticationBloc;

  WheelBloc(
    // {
    // @required this.userRepository,
    // @required this.authenticationBloc,
  // })  : assert(userRepository != null),
  //       assert(authenticationBloc != null),
  ): super(WheelInitial());
  

  // @override
  // WheelState get initialState => WheelInitial();

  @override
  Stream<WheelState> mapEventToState(
    WheelEvent event,
  ) async* {
    if (event is WheelButtonPressed) {
      yield WheelLoading();
      try {
        placeStake( '550');
      } catch(error){
        print('STAKEERROR$error');
      }

      try {

        
      //   final user = await userRepository.authenticate(
      //     username: event.username,
      //     password: event.password,
      //   );
      await Future<void>.delayed(const Duration(seconds: 10));
      final double vel =8500;

      //   authenticationBloc.add(LoggedIn(user: user));
        yield WheelSpinning(velocity:vel );
      } catch (error) {

        // if (error.toString().contains('Connection')) {
        //   yield WheelFaliure(error:'Check your internet connection  and try again');
        //   } else if(error.toString().contains('credential')) {
        //   yield WheelFaliure(error:'Password or username is incorrect');
        //   }else if(error.toString().contains('blank')) {  //username or password//TO DO
        //   yield WheelFaliure(error:'Username or password field cannot be blank');
        //   }else{
        //     yield WheelFaliure(error:error.toString());
        //   }


        yield WheelFaliure(error: error.toString());
      }
    }
  }
}







//         yield WheelFaliure(error: error.toString());
//       }
//     }
//   }
// }
