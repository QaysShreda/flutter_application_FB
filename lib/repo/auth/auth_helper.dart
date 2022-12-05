import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/repo/auth/firestore_helper.dart';
import 'package:flutter_application_1/views/screens/home_screen.dart';

import '../../models/user.dart';



class AuthHelper {
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserModel user = UserModel();

  signUp(String email, String password,String fName, String lName, String phone, ) async {
    try {
      UserCredential? userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password).then((value) {
            
            user.id = value.user!.uid.toString();
            user.fName = fName;
            user.lName = lName;
            user.phone = phone;
            user.email = email;
            print("Hello");
            print("User id === ${user.id}");
            
          
          }).then((value){
            FireStoreHelper.fireStoreHelper.addNewUser(user);
          });

        
      
      
    } on Exception catch (e) {
      log(e.toString());
      return "None";
    }
  }

  Future<UserCredential?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
          return userCredential;
    } on Exception catch (e) {
      
      log(e.toString());

    }
  }

  resetPassword(String email) async {}

  verifyEmial(String email) async {}
}
