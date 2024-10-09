import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.keyboardType,
      required this.controller,
      required this.validator});
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color:
              Colors.grey.shade400, // Slightly lighter shade for the hint text
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.grey, // Border color when the field is enabled
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.grey, // Border color when the field is focused
          ),
        ),
      ),
      validator: validator,
      keyboardType: keyboardType,
      style: TextStyle(
        color: Colors.black, // Text input color
      ),
    );
    ;
  }
}
