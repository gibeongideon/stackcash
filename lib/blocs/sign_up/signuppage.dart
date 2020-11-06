// import 'package:equatable/equatable.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stackcash/blocs/sign_up/bloc/my_form_bloc.dart';
import 'package:formz/formz.dart';
import 'package:stackcash/ui/const/color_const.dart';
import 'package:stackcash/ui/const/gradient_const.dart';

// void main() {
//   EquatableConfig.stringify = kDebugMode;
//   runApp(App());
// }

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: YELLOW,
          title: const Text('StackPesa | Register',style: TextStyle( color:Colors.deepPurpleAccent, fontSize: 20.0))),
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
        if (state.status.isSubmissionFailure) {
          Scaffold.of(context).hideCurrentSnackBar();
          showDialog<void>(
            context: context,
            builder: (_) => InternetFailureDialog(),
          );
        }

        if (state.status.isPure) {
          Scaffold.of(context).hideCurrentSnackBar();
          showDialog<void>(
            context: context,
            builder: (_) => UserExistDialog(),
          );
        }
      },
      child:Container(

            // color: Colors.lightBlueAccent ,
        decoration: BoxDecoration(
          gradient: SIGNUP_BACKGROUND),

        child: Form(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // EmailInput(),
                PhoneNumberInput(),
                PasswordInput(),
                ConfirmPasswordInput(),
                SubmitButton(),
        
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
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();

              }//=> Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}


class InternetFailureDialog extends StatelessWidget {
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
                      'Failed to sign up! Check internet and try again',
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
            RaisedButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();

              }//=> Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}


class UserExistDialog extends StatelessWidget {

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
                      'that username already exists.Try other',
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
            RaisedButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();

              }//=> Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}