import 'package:elevate_online_exam_app/core/error_handeling/Result.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/request/ForgotPasswordRequest.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/request/ResetPasswordRequest.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/request/VerifyResetCodeRequest.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/request/register_request.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/response/ResetPasswordResponse.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/response/VerifyResetCodeResponse.dart';
import 'package:elevate_online_exam_app/features/auth/domain/model/app_user.dart';
import '../../../data/api/model/response/forgot_password_response.dart';

abstract class AuthRepo {
  Future<Result<AppUser>> login(String email, String password);
  Future<Result<AppUser>> register(RegisterRequest registerRequest);
  Future<Result<ForgotPasswordResponse>> forgetPassword(ForgotPasswordRequest forgotPasswordRequest);
  Future<Result<VerifyResetCodeResponse>> verifyResetCode(VerifyResetCodeRequest forgotPasswordRequest);
  Future<Result<ResetPasswordResponse>> resetPassword(ResetPasswordRequest resetPasswordRequest);

}
