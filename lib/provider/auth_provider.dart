import 'package:flutter/cupertino.dart';
import 'package:string_validator/string_validator.dart';

class AuthProvider extends ChangeNotifier {
  GlobalKey<FormState> signInKey = GlobalKey();
  GlobalKey<FormState> signUpKey = GlobalKey();
  late String email;
  late String password;
  saveEmail(email) {
    this.email = email;
  }

  savePassword(password) {
    this.password = password;
  }

  String? emailValidator(String email) {
    if (email.isEmpty) {
      return "Field is required";
    } else if (!isEmail(email)) {
      return "Incorect email syntax";
    }
  }

  String? passwordValidator(String password) {
    if (password.isEmpty) {
      return "Field is required";
    } else if (password.length < 6) {
      return "password should be more than 6 digit";
    }
  }
}
