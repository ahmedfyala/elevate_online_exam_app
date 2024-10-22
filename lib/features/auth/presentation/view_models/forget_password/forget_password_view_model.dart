import 'package:elevate_online_exam_app/core/error_handeling/Result.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/response/ResetPasswordResponse.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/response/VerifyResetCodeResponse.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/response/forgot_password_response.dart';
import 'package:elevate_online_exam_app/features/auth/presentation/view_models/forget_password/forget_password_action.dart';
import 'package:elevate_online_exam_app/features/auth/usecases/resetPassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../data/api/model/request/ForgotPasswordRequest.dart';
import '../../../data/api/model/request/ResetPasswordRequest.dart';
import '../../../data/api/model/request/VerifyResetCodeRequest.dart';
import '../../../usecases/forget_password_usecase.dart';
import '../../../usecases/verify_reset_code.dart';
import 'forget_password_state.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgotPasswordState> {
  ForgetPasswordViewModel(
      this.forgetPasswordUseCase, this.verifyResetCodeUseCase,this.resetPasswordUseCase)
      : super(ForgotPasswordInitial());
  ForgetPasswordUseCase forgetPasswordUseCase;
  VerifyResetCodeUseCase verifyResetCodeUseCase;
  ResetPasswordUseCase resetPasswordUseCase;
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController otpCode = TextEditingController();
  TextEditingController resetPasswordController = TextEditingController();
  TextEditingController confirmResetPasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void doAction(ForgetPasswordAction action) {
    switch (action) {
      case ForgetPassword():
        _forgetPassword();
        break;
      case SendOTP():
        _verifyResetCode();
        break;

      case ResetPassword():
      _resetPassword();
      break;
      case VerifyOTP():
    }
  }

  void _forgetPassword() async {
    if (formKey.currentState!.validate()) {
      emit(ForgotPasswordLoading());
      var response = await forgetPasswordUseCase.invoke(ForgotPasswordRequest(
        email: emailTextEditingController.text.trim(),
      ));
      switch (response) {
        case Success<ForgotPasswordResponse>():
          emit(ForgotPasswordSuccess());
          break;
        case Fail<ForgotPasswordResponse>():
          emit(ForgotPasswordFailure(response.exception));
          break;
        case Loading<ForgotPasswordResponse>():

      }
    }
  }

  void _verifyResetCode() async {
    if (formKey.currentState!.validate()) {
      emit(OTPSentLoading());
      var response = await verifyResetCodeUseCase.invoke(VerifyResetCodeRequest(
        resetCode: otpCode.text.trim(),
      ));
      switch (response) {
        case Success<VerifyResetCodeResponse>():
          emit(OTPSentSuccess());
          break;
        case Fail<VerifyResetCodeResponse>():
          OTPSentFailure(response.exception);
          break;
        case Loading<VerifyResetCodeResponse>():
      }
    }
  }

  void _resetPassword() async {
    if (formKey.currentState!.validate()) {
      emit(ResetPasswordLoading());
      var response = await resetPasswordUseCase.invoke(ResetPasswordRequest(
        email: "afyala115@gmail.com",
        newPassword: resetPasswordController.text,
      ));
      print("-----------------------------------------------------------${response}");

      switch (response) {

        case Success<ResetPasswordResponse>():
         emit(ResetPasswordSuccess());
        case Fail<ResetPasswordResponse>():
          emit(ResetPasswordFailure(response.exception));
        case Loading<ResetPasswordResponse>():

      }
    }
  }
}
