import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:stackcash/blocs/log_in/repository/user_repository.dart';
import 'package:stackcash/blocs/log_in/model/user_model.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(UserRepository != null),
      super(AuthenticationUnintialized());

  // @override
  // AuthenticationState get initialState => AuthenticationUnintialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {

      final bool hasToken = await userRepository.hasToken();

      if (hasToken) {

        await userRepository.delteToken(id: 0);/// bug fix/  ensure previous users are deleated on app start//No automatic login
        yield AuthenticationUnauthenticated();
  
      } else {
        yield AuthenticationUnauthenticated();
      }
    }
    if (event is LoggedIn) {
      yield AuthenticationLoading();

      await userRepository.persistToken(
        user: event.user
      );
      // IMPLEMENT GET USER ID HERE and pass to next
      yield AuthenticationAuthenticated(user: event.user) ;
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();

      await userRepository.delteToken(id: 0);

      yield AuthenticationUnauthenticated();
    }

    if (event is SignUpButtonPressed) {
      // yield AuthenticationLoading();

      // await userRepository.delteToken(id: 0);

      yield SignUpState();
    }
  }
}
