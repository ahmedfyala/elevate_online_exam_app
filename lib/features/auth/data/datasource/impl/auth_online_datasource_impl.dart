import 'dart:async';

import 'package:elevate_online_exam_app/core/api_executer/api_extensions.dart';
import 'package:elevate_online_exam_app/core/error_handeling/Result.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/request/ResetPasswordRequest.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/request/VerifyResetCodeRequest.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/request/register_request.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/response/ResetPasswordResponse.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/response/VerifyResetCodeResponse.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/response/forgot_password_response.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/retrofit_client.dart';
import 'package:elevate_online_exam_app/features/auth/data/datasource/contracts/auth_datasource.dart';
import 'package:elevate_online_exam_app/features/auth/domain/model/app_user.dart';
import 'package:injectable/injectable.dart';

import '../../api/model/request/ForgotPasswordRequest.dart';

@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDatasourceImpl extends AuthOnlineDataSource {
  RetrofitClient retrofitClient;

  AuthOnlineDatasourceImpl(this.retrofitClient);

  @override
  Future<Result<AppUser>> login(String email, String password) async {
    return executeApi<AppUser>(
      () async {
        var result = await retrofitClient.login({
          "email": email,
          "password": password,
        });
        var appUser = AppUser(
          email: email,
          token: result.token,
        );
        return Success(data: appUser);
      },
    );
  }

  @override
  Future<Result<AppUser>> register(RegisterRequest registerRequest) async {
    return executeApi<AppUser>(
      () async {
        var result = await retrofitClient.register(registerRequest);
        var appUser = AppUser(
          firstName: registerRequest.firstName,
          lastName: registerRequest.lastName,
          phoneNumber: registerRequest.phone,
          email: registerRequest.email,
          token: result.token,
        );
        return Success(data: appUser);
      },
    );
  }

  @override
  Future<Result<ForgotPasswordResponse>> forgetPassword(
      ForgotPasswordRequest forgotPasswordRequest) async {
    return executeApi<ForgotPasswordResponse>(
      () async {
        var result = await retrofitClient.forgetPassword(forgotPasswordRequest);
        var forgetPassword = ForgotPasswordResponse(
          message: forgotPasswordRequest.email,
        );
        return Success(data: forgetPassword);
      },
    );
  }

  @override
  Future<Result<VerifyResetCodeResponse>> verifyResetCode(
      VerifyResetCodeRequest verifyResetCodeRequest) async {
    return executeApi<VerifyResetCodeResponse>(
      () async {
        var result =
            await retrofitClient.verifyResetCode(verifyResetCodeRequest);

        return Success(data: result);
      },
    );
  }

  @override
  Future<Result<ResetPasswordResponse>> resetPassword(
      ResetPasswordRequest resetPasswordRequest) async {
    return executeApi<ResetPasswordResponse>(
      () async {
        var result = await retrofitClient.resetPassword(resetPasswordRequest);
        print("-----------------------------------------------------------${resetPasswordRequest.email}");
        return Success(data: result);
      },
    );
  }
}
