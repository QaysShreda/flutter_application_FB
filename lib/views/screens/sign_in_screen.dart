import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';

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
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextField(
                      label: "Enter your Email",
                      validation: provider.emailValidator,
                      onSave: provider.saveEmail,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "This field is Requred";
                        } else if (value.length < 6) {
                          return "Passowrd should be grater  than 6 digits";
                        }
                      }),
                      decoration: InputDecoration(
                          hintText: 'Enter your Password',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          }
                        },
                        child: Text("Sign In"))
                  ]),
            ),
          );
        }));
  }
}
