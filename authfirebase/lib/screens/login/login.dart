import 'package:flutter/material.dart';

import 'local_widgets/login_form.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20.0),
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Text('Hello User'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                LoginForm(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
