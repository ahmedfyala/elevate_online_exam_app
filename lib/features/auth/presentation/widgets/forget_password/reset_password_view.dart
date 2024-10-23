import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_strings.dart';
import 'body_view/reset_password_body.dart';

class ResetPasswordView extends StatelessWidget {
  final String? email;
  const ResetPasswordView({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(AppStrings.resetPassword, style: TextStyle(fontSize: 18.sp)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ResetPasswordBody(
        email: email,
      ),
    );
  }
}
