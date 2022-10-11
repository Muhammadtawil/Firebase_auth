import 'package:flutter/material.dart';

import '../../../utilis/shadow_container.dart';
import '../../signup/signup.dart';

enum LoginType {
  email,
  google,
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // void _loginUser({
  //   required LoginType type,
  //   required String email,
  //   required String password,
  //   required BuildContext context,
  // }) async {
  //   try {
  //     String _returnString;

  //     switch (type) {
  //       case LoginType.email:
  //         _returnString = await Auth().loginUserWithEmail(email, password);
  //         break;
  //       case LoginType.google:
  //         _returnString = await Auth().loginUserWithGoogle();
  //         break;
  //       default:
  //     }

  //     if (_returnString == "success") {
  //       Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => OurRoot(),
  //         ),
  //         (route) => false,
  //       );
  //     } else {
  //       Scaffold.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(_returnString),
  //           duration: const Duration(seconds: 2),
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Widget _googleButton() {
  //   return OutlineButton(
  //     splashColor: Colors.grey,
  //     onPressed: () {
  //       _loginUser(type: LoginType.google, context: context);
  //     },
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
  //     highlightElevation: 0,
  //     borderSide: BorderSide(color: Colors.grey),
  //     child: Padding(
  //       padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
  //       child: Row(
  //         mainAxisSize: MainAxisSize.min,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Image(image: AssetImage("assets/google_logo.png"), height: 25.0),
  //           Padding(
  //             padding: const EdgeInsets.only(left: 10),
  //             child: Text(
  //               'Sign in with Google',
  //               style: TextStyle(
  //                 fontSize: 20,
  //                 color: Colors.grey,
  //               ),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      child: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
            child: Text(
              "Log In",
              style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.alternate_email),
              hintText: "Email",
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock_outline),
              hintText: "Password",
            ),
            obscureText: true,
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextButton(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: Text(
                "Log In",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            onPressed: () {
              // _loginUser(
              //     type: LoginType.email,
              //     email: _emailController.text,
              //     password: _passwordController.text,
              //     context: context);
            },
          ),
          TextButton(
            child: const Text("Don't have an account? Sign up here"),
            // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SignUp(),
                ),
              );
            },
          ),
          // _googleButton(),
        ],
      ),
    );
  }
}
