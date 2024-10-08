import 'package:dio/dio.dart';
import 'package:elevate_online_exam_app/core/constants/api_constants.dart';
import 'package:elevate_online_exam_app/features/auth/data/api/model/response/auth_response.dart';
import 'package:retrofit/http.dart';

part 'retrofit_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class RetrofitClient {
  factory RetrofitClient(Dio dio, {String? baseUrl}) = _RetrofitClient;

  @POST(ApiConstants.loginApi)
  Future<AuthResponse> login(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.registerApi)
  Future<AuthResponse> register(@Body() Map<String, dynamic> body);
}
