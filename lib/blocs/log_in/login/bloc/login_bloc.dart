import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:stackcash/blocs/log_in/bloc/authentication_bloc.dart';
import 'package:stackcash/blocs/log_in/repository/user_repository.dart';


part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null),
        super(LoginInitial());
  

  // @override
  // LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginInitial();

      try {
        final user = await userRepository.authenticate(
          username: event.username,
          password: event.password,
        );

        authenticationBloc.add(LoggedIn(user: user));
        yield LoginInitial();
      } catch (error) {
        

        if (error.toString().contains('Connection')) {
          yield LoginFaliure(error:'Check your internet connection  and try again');
          } else if(error.toString().contains('credential')) {
          yield LoginFaliure(error:'Password or username is incorrect');
          }else if(error.toString().contains('blank')) {  //username or password//TO DO
          yield LoginFaliure(error:'Username or password field cannot be blank');
          }else{
            yield LoginFaliure(error:error.toString());
          }


        // yield LoginFaliure(error: error.toString());
      }
    }
  }
}







//         yield LoginFaliure(error: error.toString());
//       }
//     }
//   }
// }
