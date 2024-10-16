import 'package:elevate_online_exam_app/core/widgets/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

showLoading(BuildContext context, String? message) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CustomAlertDialog(
        text: message,
      );
    },
  );
}

hideLoading(BuildContext context) {
  if (GoRouter.of(context).canPop()) {
    GoRouter.of(context).pop();
  }
}
