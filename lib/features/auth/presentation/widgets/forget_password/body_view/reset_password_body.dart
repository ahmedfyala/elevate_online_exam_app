import 'package:elevate_online_exam_app/core/helpers/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/di/di.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/widgets/custom_auth_button.dart';
import '../../../../../../core/widgets/custom_text_form_feild.dart';
import '../../../view_models/forget_password/forget_password_action.dart';
import '../../../view_models/forget_password/forget_password_state.dart';
import '../../../view_models/forget_password/forget_password_view_model.dart';

class ResetPasswordBody extends StatefulWidget {
  const ResetPasswordBody({super.key});

  @override
  State<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  bool isPasswordVisible = true;
  ForgetPasswordViewModel forgetPasswordViewModel =
      getIt<ForgetPasswordViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordViewModel, ForgotPasswordState>(
      bloc: forgetPasswordViewModel,
      listener: (context, state) {
        if (state is ResetPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failure")),
          );
        } else if (state is ResetPasswordLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Loading")),
          );
        } else if (state is ResetPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Success")),
          );
          context.go(Routes.loginScreen);
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
                AppStrings.resetPassword,
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              Text(
                AppStrings.passwordRequirements,
                style: TextStyle(fontSize: 16.sp),
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                labelText: AppStrings.newPassword,
                hintText: AppStrings.enterNewPasswordHint,
                keyboardType: TextInputType.visiblePassword,
                controller: forgetPasswordViewModel.resetPasswordController,
                isPasswordVisible: isPasswordVisible,
                showPassword: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                validator: (value) =>
                    Validations.validatePassword(context, value),
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                labelText: AppStrings.confirmPassword,
                hintText: AppStrings.confirmPasswordHint,
                keyboardType: TextInputType.visiblePassword,
                controller:
                    forgetPasswordViewModel.confirmResetPasswordController,
                isPasswordVisible: isPasswordVisible,
                showPassword: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                validator: (value) => Validations.validateConfirmPassword(
                    context,
                    forgetPasswordViewModel.resetPasswordController.text,
                    value),
              ),
              SizedBox(height: 20.h),
              CustomAuthButton(
                text: AppStrings.continueText,
                onPressed: () {
                  forgetPasswordViewModel.doAction(ResetPassword());
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
