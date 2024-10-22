import 'package:elevate_online_exam_app/core/error_handeling/Result.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/request/ForgotPasswordRequest.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/request/VerifyResetCodeRequest.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/request/register_request.dart';
import 'package:elevate_online_exam_app/features/auth/domain/model/app_user.dart';

import '../../api/model/request/ResetPasswordRequest.dart';
import '../../api/model/response/ResetPasswordResponse.dart';
import '../../api/model/response/VerifyResetCodeResponse.dart';
import '../../api/model/response/forgot_password_response.dart';

abstract class AuthOnlineDataSource {
  Future<Result<AppUser>> login(String email, String password);
  Future<Result<AppUser>> register(RegisterRequest registerRequest);
  Future<Result<ForgotPasswordResponse>> forgetPassword(ForgotPasswordRequest forgotPasswordRequest);
  Future<Result<VerifyResetCodeResponse>> verifyResetCode(VerifyResetCodeRequest verifyResetCodeRequest);
  Future<Result<ResetPasswordResponse>> resetPassword(ResetPasswordRequest resetPasswordRequest);

}

abstract class AuthOfflineDataSource {
  Future<Result<AppUser>> login(String email, String password);
}
