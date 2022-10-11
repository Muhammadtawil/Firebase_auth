import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CurrentUser with ChangeNotifier {
  String? _uid;
  String? _email;

  String? get uid => _uid;
  String? get email => _email;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signUpUser(String email, String password) async {
    String retVal = 'error';

    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      retVal = 'success';
    } catch (e) {
      retVal = e.toString();
    }

    return retVal;
  }

  Future<String> loginUserWithEmailPassword(
      String email, String password) async {
    String retVal = 'error';

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _uid = FirebaseAuth.instance.currentUser!.uid;
      _email = FirebaseAuth.instance.currentUser!.email;
      retVal = 'success';
    } catch (e) {
      retVal = e.toString();
    }

    return retVal;
  }

  Future<String> loginUserWithGoogle() async {
    String retVal = 'error';
    // GoogleSignIn googleSignIn = GoogleSignIn(
    //   scopes: [
    //     'email',
    //     'https://www.googleapis.com/auth/contacts.readonly',
    //   ],
    // );
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential =
          GoogleAuthProvider.credential(idToken: googleAuth?.idToken);

      await _auth.signInWithCredential(credential);
      _uid = FirebaseAuth.instance.currentUser!.uid;
      _email = FirebaseAuth.instance.currentUser!.email;
      retVal = 'success';
    } catch (e) {
      retVal = e.toString();
    }

    return retVal;
  }
}
