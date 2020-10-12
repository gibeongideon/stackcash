import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:flutter_form_validation/models/models.dart';
import 'package:stackcash/bloc_signup/models/models.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stackcash/bloc_signup/register_user/api_post_user.dart';

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

        // await Future<void>.delayed(const Duration(seconds: 1));

      // try {
        await placeStake(state.email.value,state.password.value);
          // emit(state.copyWith(status: FormzStatus.submissionSuccess));
          // } on Exception {
          //   emit(state.copyWith(status: FormzStatus.submissionFailure));
          //   }

        yield state.copyWith(status: FormzStatus.submissionSuccess);

        
      //  else{
      //    print('Password dont match');
      //    yield state.copyWith(status: FormzStatus.submissionFailure);
      //  }

      }
    }
    

  }
}
