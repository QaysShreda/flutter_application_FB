import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/provider/auth_provider.dart';
import 'package:flutter_application_1/views/screens/sign_up_screen.dart';
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
                      ctr: mailController,
                      
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(validation: provider.passwordValidator,
                     label: "Enter Your Password", 
                     ctr: passwordController,
                     ),
                   
                    TextButton(onPressed: (){}, child: Text("Forgit Password")),
                     SizedBox(
                      height: 5,
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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60.0),
                          child: Text("Login"),
                        )),
                        SizedBox(height: 40,),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
                        }, child: Text("SignUp for New User")),

                  ]),
            ),
          );
        }));
  }
}
