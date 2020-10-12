// import 'package:equatable/equatable.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:stackcash/bloc/my_form_bloc.dart';
import 'package:stackcash/bloc_signup/bloc/my_form_bloc.dart';
import 'package:formz/formz.dart';

// void main() {
//   EquatableConfig.stringify = kDebugMode;
//   runApp(App());
// }

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('StackPesa | Register')),
        body: BlocProvider(
          create: (_) => MyFormBloc(),
          child: SignUpForm(),
        ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<MyFormBloc, MyFormState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          Scaffold.of(context).hideCurrentSnackBar();
          showDialog<void>(
            context: context,
            builder: (_) => SuccessDialog(),
          );
        }
        if (state.status.isSubmissionInProgress) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Submitting...')),
            );
        }
      },
      child:Container(
            color: Colors.lightBlueAccent ,
            child: Form(
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    EmailInput(),
                    PhoneNumberInput(),
                    PasswordInput(),
                    ConfirmPasswordInput(),
                    SubmitButton(),



                    // Container(
                    //   // width: MediaQuery.of(context).size.width * 0.85,
                    //   // height: MediaQuery.of(context).size.width * 0.12,
                    //   child: Padding(
                    //     padding: EdgeInsets.only(top: 10.0),
                    //     child: Column(
                    //       children: <Widget>[
                    //         RaisedButton(
                    //       onPressed: state is! LoginLoading
                    //           ? _onLoginButtonPressed
                    //           : null,
                    //       child: Text(
                    //         'Login',
                    //         style: TextStyle(
                    //           fontSize: 18.0,
                    //         ),
                    //       ),
                    //       shape: StadiumBorder(
                    //         side: BorderSide(
                    //           color: Colors.blue,
                    //           width: 1,
                    //         ),
                    //       ),
                    //     ),
                    
                    //       ],
                    //     ), 
                    //   ),
                    // ),
                    // Container(
                    //   // width: MediaQuery.of(context).size.width * 0.55,
                    //   // height: MediaQuery.of(context).size.width * 0.12,
                    //   child: Padding(
                    //     padding: EdgeInsets.only(top: 10.0),
                    //     child: Column(
                    //       children: <Widget>[

                    //         Text('Don\'t have an account?',style: TextStyle(fontFamily: 'Montserrat'),
                    //     ),
                    //     RaisedButton(
                    //       onPressed: () {
                    //         Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage()), );
                    //       },
                    //       child: Text(
                    //         'Register Here',
                    //         style: TextStyle(
                    //           fontSize: 13.0,
                    //         ),
                    //       ),
                    //       shape: StadiumBorder(
                    //         side: BorderSide(
                    //           color: Colors.blue,
                    //           width: 1,
                    //         ),
                    //       ),
                    //     ),

                    //       ],
                    //     ), 
                    //   ),
                    // ),
      //  Padding(
    //     padding: EdgeInsets.all(2.0),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: <Widget>[
    //         // EmailInput(),
    //         PhoneNumberInput(),
    //         PasswordInput(),
    //         ConfirmPasswordInput(),
    //         SubmitButton(),
            
          ],
        ),

    )
    
    )
    ),
    );


  }
}
class PhoneNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyFormBloc, MyFormState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.email.value,
          decoration: InputDecoration(
            icon: const Icon(Icons.phone),
            labelText: 'Mobile Number',
            errorText: state.email.invalid ? 'Invalid Mobile Number' : null,
          ),
          keyboardType: TextInputType.phone,
          onChanged: (value) {
            context.bloc<MyFormBloc>().add(EmailChanged(email: value));
          },
        );
      },
    );
  }
}

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyFormBloc, MyFormState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.email.value,
          decoration: InputDecoration(
            icon: const Icon(Icons.email),
            labelText: 'Email',
            errorText: state.email.invalid ? 'Invalid Email' : null,
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            context.bloc<MyFormBloc>().add(EmailChanged(email: value));
          },
        );
      },
    );
  }
}

class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyFormBloc, MyFormState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.password.value,
          decoration: InputDecoration(
            icon: const Icon(Icons.lock),
            labelText: 'Password',
            errorText: state.password.invalid ? 'Invalid Password' : null,
          ),
          obscureText: true,
          onChanged: (value) {
            context.bloc<MyFormBloc>().add(PasswordChanged(password: value));
          },
        );
      },
    );
  }
}


class ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyFormBloc, MyFormState>(
      buildWhen: (previous, current) => previous.vpassword != current.vpassword,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.vpassword.value,
          decoration: InputDecoration(
            icon: const Icon(Icons.lock),
            labelText: 'Confirm Password'   ,
            errorText: (state.password == state.vpassword) ? null : 'Password dont match yet!' ,
          ),
          obscureText: true,
          onChanged: (value) {
            context.bloc<MyFormBloc>().add(VPasswordChanged(vpassword: value));
          },
        );
      },
    );
  }
}
class SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyFormBloc, MyFormState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return RaisedButton(
          onPressed:state.status.isValidated
              ? () => context.bloc<MyFormBloc>().add(FormSubmitted())
              : null,

          shape: StadiumBorder(
            side: BorderSide(color: Colors.blue,width: 1,),
            ),
          // (){
          //   if (state.status.isValidated){
          //     if (state.password ==state.vpassword){
          //       return context.bloc<MyFormBloc>().add(FormSubmitted());
          //   }

          //   }
            
          // },

          child: const Text('Submit'),
        );
      },
    );
  }
}

class SuccessDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const Icon(Icons.info),
                const Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Signup Successfully! Login now ?',
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
            RaisedButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
