part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  // const AuthenticationState();
  const AuthenticationState({this.user});

  final User user;
  
  @override
  List<Object> get props => [];
}

class AuthenticationUnintialized extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final User user;

  const AuthenticationAuthenticated({@required this.user});

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'LoggedIn { user: $user.username.toString() }';
}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class SignUpState extends AuthenticationState{}
