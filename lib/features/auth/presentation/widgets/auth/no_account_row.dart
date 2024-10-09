import 'package:elevate_online_exam_app/core/constants/color.dart';
import 'package:flutter/material.dart';

class NoAccountRow extends StatelessWidget {
  const NoAccountRow(
      {super.key,
      required this.content,
      required this.actionText,
      required this.onPressed});
  final String content;
  final String actionText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          content,
          style: TextStyle(fontSize: 16.0),
        ),
        const SizedBox(
          width: 8.0,
        ),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            actionText,
            style: const TextStyle(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
