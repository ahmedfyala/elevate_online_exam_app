import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton(
      {super.key, required this.text, required this.onPressed});
  final String? text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue.shade900, // Text color
        minimumSize:
            Size(double.infinity, 60), // Make the button expand horizontally
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // Circular corners
        ),
      ),
      child: Text(
        text!,
        style: TextStyle(
          fontSize: 18.0, // Text size
        ),
      ),
    );
  }
}
