import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class CurrentUser with ChangeNotifier {
  String? _uid;
  String? _email;

  String? get uid => _uid;
  String? get email => _email;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signUpUser(String email, String password) async {
    bool retVal = false;

    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      retVal = true;
      // if (user != null) {
      //   retVal = true;
      // }
    } catch (e) {
      rethrow;
    }

    return retVal;
  }

  Future<bool> loginUser(String email, String password) async {
    bool retVal = false;

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _uid = FirebaseAuth.instance.currentUser!.uid;
      _email = FirebaseAuth.instance.currentUser!.email;
      retVal = true;
      // if (_user != null) {
      //   retVal = true;
      // }
    } catch (e) {
      rethrow;
    }

    return retVal;
  }
}
