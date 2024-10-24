import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:elevate_online_exam_app/core/di/di.dart';
import 'package:elevate_online_exam_app/core/helpers/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/error_handeling/handle_error.dart';
import '../../../../../../core/functions/show_awesome_dialoge.dart';
import '../../../../../../core/functions/show_hide_loading.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/widgets/custom_auth_button.dart';
import '../../../../../../core/widgets/custom_text_form_feild.dart';
import '../../../view_models/forget_password/forget_password_action.dart';
import '../../../view_models/forget_password/forget_password_state.dart';
import '../../../view_models/forget_password/forget_password_view_model.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  ForgetPasswordViewModel forgetPasswordViewModel =
      getIt<ForgetPasswordViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordViewModel, ForgotPasswordState>(
      bloc: forgetPasswordViewModel,
      listener: (context, state) {
        if (state is ForgotPasswordFailure) {
          var exception = state.exception;
          String? message = errorStateHandler(exception!);
          showAwesomeDialog(context,
              title: 'Error',
              desc: message!,
              onOk: () {},
              dialogType: DialogType.error);
        } else if (state is ForgotPasswordLoading) {
          showLoading(context, 'Sending OTP...');
        } else if (state is ForgotPasswordSuccess) {
          context.go(Routes.otpScreen,
              extra: forgetPasswordViewModel.emailTextEditingController.text);
        }
      },
      child: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Form(
          key: forgetPasswordViewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.forgetPassword,
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              Text(
                AppStrings.enterEmail,
                style: TextStyle(fontSize: 16.sp),
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                labelText: AppStrings.email,
                hintText: AppStrings.enterEmailHint,
                keyboardType: TextInputType.emailAddress,
                controller: forgetPasswordViewModel.emailTextEditingController,
                validator: (value) => Validations.validateEmail(context, value),
              ),
              SizedBox(height: 20.h),
              CustomAuthButton(
                text: AppStrings.continueText,
                onPressed: () {
                  forgetPasswordViewModel.doAction(ForgetPassword());
                },
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
