import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../states/current_user.dart';
import '../../../utilis/shadow_container.dart';
import '../../home_screen.dart/home_screen.dart';
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

//   void _loginUser({
//     // required LoginType type,
//     required String email,
//     required String password,
//     required BuildContext context,
//   }) async {
//         final currentUser = Provider.of<CurrentUser>(context, listen: false);
//     try {

//        if (await currentUser.loginUser(email, password)) {
// if (mounted) {
//          Navigator.of(context).pushNamed(HomePage.routeName);

// }       }
//       }
//     } catch (e) {
//      rethrow;
//     }
// }

  void _loginUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    final currentUser = Provider.of<CurrentUser>(context, listen: false);
    try {
      if (await currentUser.loginUser(email, password)) {
        if (mounted) {
          Navigator.of(context).pushReplacementNamed(HomePage.routeName);
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('wrong Password'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('wrong Password $e'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
  }

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
          ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.purple),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: Text(
                "Log In",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            onPressed: () {
              _loginUser(
                  // type: LoginType.email,
                  email: _emailController.text,
                  password: _passwordController.text,
                  context: context);
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
