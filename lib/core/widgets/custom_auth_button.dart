import 'package:flutter/material.dart';

import '../constants/app_color.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    this.textColor = Colors.white,
  });

  final String? text;
  final void Function()? onPressed;
  final Color color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: color, // Set the button color
        minimumSize: const Size(double.infinity, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: const BorderSide(
              color: AppColor.primaryColor, width: 2.0), // Add blue border
        ),
      ),
      child: Text(
        text!,
        style: TextStyle(
          fontSize: 18.0,
          color: textColor,
        ),
      ),
    );
  }
}
