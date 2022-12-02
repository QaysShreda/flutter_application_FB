import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/auth/auth_helper.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FireBase"),
      ),
      body: Form(
        key: formKey,
        child: Column(children: [
          TextFormField(
            validator: (v) {
              if (v == null) {
                return "erquired field";
              } else if (!(v.contains('@'))) {
                return 'Incorrect email';
              }
            },
            controller: mailController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Enter Your Email'),
          ),
          const SizedBox(
            height: 40,
          ),
          TextFormField(
            validator: (v) {
              if (v == null) {
                return "required field";
              } else if (v.length <= 6) {
                return 'Error, the password should be larger than 6 letters';
              }
            },
            controller: passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Password',
            ),
          ),
          OutlinedButton(
              onPressed: () {
                bool isValid = formKey.currentState!.validate();
                if (isValid) {
                  AuthHelper.authHelper
                      .signUp(mailController.text, passwordController.text);
                }
              },
              child: Text('Save'))
        ]),
      ),
    );
  }
}
