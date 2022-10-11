import 'package:authfirebase/screens/signup/widget/local_widgets/sign_up_form.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  static const routeName = '/sign-up';

  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20.0),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    BackButton(),
                  ],
                ),
                const SizedBox(
                  height: 40.0,
                ),
                const SignUpForm(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
