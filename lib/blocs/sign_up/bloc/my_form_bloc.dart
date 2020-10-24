import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:stackcash/blocs/sign_up/models/models.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stackcash/blocs/sign_up/register_user/api_post_user.dart';

part 'my_form_event.dart';
part 'my_form_state.dart';


class MyFormBloc extends Bloc<MyFormEvent, MyFormState> {
  MyFormBloc() : super(const MyFormState());

  // final ApiConnect _apiConnect;

  @override
  void onTransition(Transition<MyFormEvent, MyFormState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<Transition<MyFormEvent, MyFormState>> transformEvents(
    Stream<MyFormEvent> events,
    TransitionFunction<MyFormEvent, MyFormState> transitionFn,
  ) {
    final debounced = events
        .where((event) => event is! FormSubmitted)
        .debounceTime(const Duration(milliseconds: 300));
    return events
        .where((event) => event is FormSubmitted)
        .mergeWith([debounced]).switchMap(transitionFn);
  }

  @override
  Stream<MyFormState> mapEventToState(MyFormEvent event) async* {
    if (event is EmailChanged) {
      final email = Email.dirty(event.email);
      yield state.copyWith(
        email: email,
        status: Formz.validate([email, state.password,state.vpassword]),
      );
    } else if (event is PasswordChanged) {
      final password = Password.dirty(event.password);
      yield state.copyWith(
        password: password,
        status: Formz.validate([state.email,state.vpassword, password]),
      );
    } else if (event is VPasswordChanged) {
      final vpassword = Password.dirty(event.vpassword);
      FormzStatus status;

      if (state.password == vpassword){
        status = FormzStatus.valid;
      } else{
        status = FormzStatus.invalid ;
      }
    
      yield state.copyWith(
        vpassword: vpassword,
        status: status,//Formz.validate([state.email,state.password, vpassword]),
      );
      print(Formz.validate([state.email,state.password, vpassword]));
    } else if (event is FormSubmitted) {
      // if (!state.status.isValidated) return;
      if (state.status.isValidated) {
        yield state.copyWith(status: FormzStatus.submissionInProgress);



        ////me
        try {

          await signUp(state.email.value,state.password.value);

          yield state.copyWith(status: FormzStatus.submissionSuccess);
          
          // yield LoginInitial();
        }  on  Exception catch (error) {
          
          print('MY ERRROR$error');
          yield state.copyWith(status: FormzStatus.submissionFailure);


          // if (error.toString().contains('Connection')) {
          //   yield LoginFaliure(error:'Check your internet connection  and try again');
          //   } else if(error.toString().contains('credential')) {
          //   yield LoginFaliure(error:'Password or username is incorrect');
          //   }else if(error.toString().contains('username')) {  //username or password//TO DO
          //   yield LoginFaliure(error:'Username or password field cannot be blank');
          //   }else{
          //     yield LoginFaliure(error:error.toString());
          //   }


        // yield LoginFaliure(error: error.toString());
      }
        ///me

        // await Future<void>.delayed(const Duration(seconds: 1));

      // try {
        // await signUp(state.email.value,state.password.value);
          // emit(state.copyWith(status: FormzStatus.submissionSuccess));
          // } on Exception {
          //   emit(state.copyWith(status: FormzStatus.submissionFailure));
          //   }

        

        
      //  else{
      //    print('Password dont match');
      //    yield state.copyWith(status: FormzStatus.submissionFailure);
      //  }

      }
    }
    

  }
}
