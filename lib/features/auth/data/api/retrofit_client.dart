import 'package:dio/dio.dart';
import 'package:elevate_online_exam_app/core/constants/api_constants.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/response/auth_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import 'model/request/register_request.dart';

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
}
