import 'package:authfirebase/screens/home_screen.dart/home_screen.dart';
import 'package:authfirebase/screens/login/login.dart';
import 'package:authfirebase/screens/signup/signup.dart';
import 'package:authfirebase/states/current_user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CurrentUser(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Login(),
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          SignUp.routeName: (context) => const SignUp(),
        },
      ),
    );
  }
}
// muhammad
// a@test.com
// test123