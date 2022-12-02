import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  signUp(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      log('success');
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  signiIn(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  resetPassword(String email) async {}

  verifyEmial(String email) async {}
}
