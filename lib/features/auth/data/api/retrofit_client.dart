import 'package:dio/dio.dart';
import 'package:elevate_online_exam_app/core/constants/api_constants.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/request/ForgotPasswordRequest.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/request/ResetPasswordRequest.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/request/VerifyResetCodeRequest.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/response/ResetPasswordResponse.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/response/VerifyResetCodeResponse.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import 'model/request/register_request.dart';
import 'model/response/auth_response.dart';
import 'model/response/forgot_password_response.dart';

part 'retrofit_client.g.dart';

@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class RetrofitClient {
  @FactoryMethod()
  factory RetrofitClient(Dio dio, {@Named('baseUrl') String? baseUrl}) =
      _RetrofitClient;

  @POST(ApiConstants.loginApi)
  Future<AuthResponse> login(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.registerApi)
  Future<AuthResponse> register(@Body() RegisterRequest body);

  @POST(ApiConstants.forgotPasswordApi)
  Future<ForgotPasswordResponse> forgetPassword(
      @Body() ForgotPasswordRequest body);

  @POST(ApiConstants.verifyResetCodeApi)
  Future<VerifyResetCodeResponse> verifyResetCode(
      @Body() VerifyResetCodeRequest body);

  @PUT(ApiConstants.resetPasswordApi)
  Future<ResetPasswordResponse> resetPassword(
      @Body() ResetPasswordRequest body);
}
