import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
   DefaultTextField({super.key, required this.controller, required this.lable, required this.icon});

  TextEditingController controller;
    String lable;
    IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      margin: EdgeInsets.all(20),
      child: TextFormField(
        //enabled: false,
        controller: controller,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          labelText: lable,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            
          )
        ),

      ),
    );
  }
}