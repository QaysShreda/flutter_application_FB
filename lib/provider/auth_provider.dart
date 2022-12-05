import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

import '../models/user.dart';

class AuthProvider extends ChangeNotifier {
  GlobalKey<FormState> signInKey = GlobalKey();
  GlobalKey<FormState> signUpKey = GlobalKey();

  UserModel userModel = UserModel();
  
  late String email;
  late String password;
  UserModel user = UserModel();


  String? emailValidator(String email) {
    if (email.isEmpty  || email == null) {
      return "Field is required";
    } else if (!isEmail(email)) {
      return "Incorect email syntax";
    }
  }

  String? requiredValidator(String text){
    if(text.isEmpty || text == null){
      return "Field is required";
    }
  }

  String? phoneValidator(String phone){
    if (phone == null || !isNumeric(phone) || phone.isEmpty ){
      return "Incorrect phone number" ;
    }
  }

  String? passwordValidator(String password) {
    if (password.isEmpty || password == null) {
      return "Field is required";
    } else if (password.length < 6) {
      return "password should be more than 6 digit";
    }
  }
}
