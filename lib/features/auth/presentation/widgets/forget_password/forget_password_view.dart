import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/routing/routes.dart';
import '../../view_models/forget_password/forget_password_state.dart';
import '../../view_models/forget_password/forget_password_view_model.dart';
import 'body_view/forget_password_body.dart';


class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text(AppStrings.forgetPassword, style: TextStyle(fontSize: 18.sp)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const ForgetPasswordBody(),
    );
  }
}
