import 'package:flutter/material.dart';

// import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackcash/blocs/log_in/repository/user_repository.dart';

import 'package:stackcash/blocs/log_in/bloc/authentication_bloc.dart';
import 'package:stackcash/blocs/log_in/login/bloc/login_bloc.dart';
import 'package:stackcash/blocs/log_in/splash/splash.dart';
import 'package:stackcash/blocs/log_in/login/login_page.dart';
import 'package:stackcash/blocs/log_in/home/home.dart';
import 'package:stackcash/blocs/log_in/common/common.dart';
// import 'package:stackcash/blocs/sign_up/signuppage.dart';
// import 'package:stackcash/data/repository/user_data_repository.dart';

class SimpleObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print (transition);
  }

  // @override
  // void onError(Bloc bloc, Object error, StackTrace stacktrace) {
  //   super.onError(bloc, error, stacktrace);
  // }
}

void main() {
  Bloc.observer = SimpleObserver();
  final userRepository = UserRepository();
  // final userDataRepository = UserDataRepository(); 

  runApp(
  
    MultiBlocProvider(
      providers: [

        BlocProvider<AuthenticationBloc>(
          create: (context) {
            return AuthenticationBloc(
              userRepository: userRepository)..add(AppStarted());
            }
          ),
        BlocProvider<LoginBloc>(
          create: (context) {
            return LoginBloc(
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
              userRepository: userRepository);
            }
          ),

        // BlocProvider<BlocA>(
        //   create: (BuildContext context) => BlocA(),
        // ),
        // BlocProvider<BlocB>(
        //   create: (BuildContext context) => BlocB(),
        // ),
        // BlocProvider<BlocC>(
        //   create: (BuildContext context) => BlocC(),
        // ),
      ],
      child: App(userRepository: userRepository),

      )



    // BlocProvider<AuthenticationBloc>(
    //   create: (context) {
    //     return AuthenticationBloc(
    //       userRepository: userRepository
    //     )..add(AppStarted());
    //   },
      // child: App(userRepository: userRepository),
    
  );
}

class App extends StatelessWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        brightness: Brightness.dark,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        // ignore: missing_return
        builder: (context, state) {
          if (state is AuthenticationUnintialized) {
            return SplashPage();
          }
          if (state is AuthenticationAuthenticated) {
            return LoginHomePage();
          }
          if (state is AuthenticationUnauthenticated) {
            return LoginPage(userRepository: userRepository,);
          }
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
          // return CircularProgressIndicator();//??
          
        },
      ),
    );
  }
}