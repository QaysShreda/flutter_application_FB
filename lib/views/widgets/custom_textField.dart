import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextField extends StatelessWidget {
  final Function validation;
  final String label;
  final TextEditingController ctr;

  const CustomTextField(
      {super.key,
      required this.validation,
      required this.label,
      required this.ctr
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ctr,
      validator: ((value) => validation(value)),
      decoration: InputDecoration(
          hintText: label,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)))),
    );
  }
}
