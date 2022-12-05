import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Consumer<AuthProvider>(builder: (context, provider, x) {
        return  Column(children: [
        Text(provider.user.fName.toString()),
        Text(provider.user.lName.toString()),
        Text(provider.user.id.toString()),
        Text(provider.user.phone.toString()),
      ]);
      })
      
     ,
    );
  }
}
