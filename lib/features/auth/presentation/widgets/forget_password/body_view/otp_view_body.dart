import 'package:elevate_online_exam_app/core/helpers/validations.dart';
import 'package:elevate_online_exam_app/core/widgets/custom_auth_button.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/view_models/forget_password/forget_password_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/di/di.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../view_models/forget_password/forget_password_state.dart';
import '../../../view_models/forget_password/forget_password_view_model.dart';

class OtpViewBody extends StatefulWidget {
  const OtpViewBody({
    super.key,
  });

  @override
  State<OtpViewBody> createState() => _OtpViewBodyState();
}

class _OtpViewBodyState extends State<OtpViewBody> {
  ForgetPasswordViewModel forgetPasswordViewModel =
      getIt<ForgetPasswordViewModel>();
  bool finished = false;

  int otpLength = 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordViewModel, ForgotPasswordState>(
      bloc: forgetPasswordViewModel,
      listener: (context, state) {
        if (state is OTPSentSuccess) {
          context.push(Routes.resetPasswordScreen);
        } else if (state is OTPSentLoading) {
          const SnackBar(
            content: Text("Loading"),
          );
        } else if (state is OTPSentFailure) {
          const SnackBar(
              content: Text("error"),);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),
                    Text(
                      AppStrings.verificationCode,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      AppStrings.verificationMessage,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Form(
                      key: forgetPasswordViewModel.formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: PinCodeTextField(
                          length: 6,
                          appContext: context,
                          obscureText: false,
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: "Poppins",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          cursorColor: Colors.blue,
                          cursorWidth: 3.w,
                          cursorHeight: 30.h,
                          animationType: AnimationType.fade,
                          keyboardType: TextInputType.number,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            fieldHeight: 50.h,
                            fieldWidth: 50.w,
                            activeFillColor: Colors.transparent,
                            borderWidth: 1.w,
                            activeBorderWidth: 1.w,
                            fieldOuterPadding: EdgeInsets.zero,
                            borderRadius: BorderRadius.circular(10.r),
                            inactiveColor: Colors.black,
                            inactiveFillColor: Colors.white,
                            activeColor: Colors.black,
                            selectedFillColor: Colors.white,
                            selectedColor: Colors.blue,
                          ),
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          validator: (String? value) =>
                              Validations.validateOTP(context, value),
                          controller: forgetPasswordViewModel.otpCode,
                          onCompleted: (v) {
                            forgetPasswordViewModel.doAction(SendOTP());
                          },
                          onChanged: (value) {
                            setState(() {
                              otpLength = value.length;
                            });
                          },
                          beforeTextPaste: (text) {
                            return true;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.didNotReceive,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.push(Routes.resetPasswordScreen);
                          },
                          child: Text(
                            AppStrings.resendCode,
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
