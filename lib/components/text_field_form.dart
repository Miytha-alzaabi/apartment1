import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {
   TextFieldForm({super.key, required this.labelText, required this.icon});
  String labelText;
 Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: icon,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.black
          ),
          prefixIconColor: Colors.black,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          )
        )
      ),
    );
  }
}