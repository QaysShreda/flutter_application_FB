import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextField extends StatelessWidget {
  final Function validation;
  final Function onSave;
  final String label;

  const CustomTextField(
      {super.key,
      required this.validation,
      required this.label,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: ((value) => onSave),
      validator: ((value) => validation()),
      decoration: InputDecoration(
          hintText: label,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)))),
    );
  }
}
