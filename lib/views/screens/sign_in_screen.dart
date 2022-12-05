import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/models/user.dart';

import 'package:flutter_application_1/provider/auth_provider.dart';
import 'package:flutter_application_1/repo/auth/firestore_helper.dart';
import 'package:flutter_application_1/views/screens/sign_up_screen.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';
import '../../repo/auth/auth_helper.dart';
import '../widgets/custom_textField.dart';
import 'home_screen.dart';

class SignInScreen extends StatelessWidget {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign In Screen"),
        ),
        body: Consumer<AuthProvider>(builder: (context, provider, x) {
          return Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextField(
                        label: "Enter your Email",
                        validation: provider.emailValidator,
                        ctr: mailController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        validation: provider.passwordValidator,
                        label: "Enter Your Password",
                        ctr: passwordController,
                      ),
                      TextButton(
                          onPressed: () {}, child: Text("Forgit Password")),
                      SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              try {
                                UserCredential? credential =
                                    await AuthHelper.authHelper.signIn(
                                        mailController.text,
                                        passwordController.text);

                                if (credential == null) {
                                  SnackBar(
                                      content: Text(
                                    "Incorrec user name or password",
                                  ));
                                } else {
                                  UserModel? user = await FireStoreHelper
                                      .fireStoreHelper
                                      .getUser(credential.user!.uid.toString());
                                  log("Credential true");

                                  if (user != null) {
                                    log("User True");
                                    provider.user = user;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen()));
                                  } else {
                                    SnackBar(
                                      content:
                                          Text("Wrong user name or password"),
                                    );
                                  }
                                }
                              } on Exception catch (e) {}
                            }
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 60.0),
                            child: Text("Login"),
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
                          child: Text("SignUp for New User")),
                    ]),
              ),
            ),
          );
        }));
  }
}
