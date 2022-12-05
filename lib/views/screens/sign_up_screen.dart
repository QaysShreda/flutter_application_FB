import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_application_1/provider/auth_provider.dart';
import 'package:flutter_application_1/views/widgets/custom_textField.dart';
import 'package:provider/provider.dart';

import '../../repo/auth/auth_helper.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailControlller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FireBase"),
      ),
      body: Consumer<AuthProvider>(builder: (context,provider,x){
return Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(children: [
              SizedBox(height: 20,),
              CustomTextField(
                ctr: fNameController,
                validation: provider.requiredValidator,
                 label: "Your Name", 
                 ),
                  SizedBox(height: 20,),
                 CustomTextField(
                  validation: provider.requiredValidator,
                   label: "Enter your last name", 
                   ctr: lNameController),
                  SizedBox(height: 20,),
                  CustomTextField(
                    validation: provider.phoneValidator,
                     label: "Enter phone number",
                      ctr: phoneController),
                  SizedBox(height: 20,),
                  CustomTextField(validation: provider.emailValidator,
                   label: "Your email", 
                   ctr: emailControlller),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(validation: provider.passwordValidator,
               label: "Enter password", 
               ctr: passwordController),
        
                const SizedBox(
                height: 20,
              ),
              OutlinedButton(
                  onPressed: () {
                    bool isValid = formKey.currentState!.validate();
                    if (isValid) {
                      AuthHelper.authHelper
                          .signUp(emailControlller.text, passwordController.text,fNameController.text,lNameController.text,phoneController.text);
                    }
                  },
                  child: Text('Save'))
            ]),
          ),
        ),
      );
      }
      
    ),);
  }
}
