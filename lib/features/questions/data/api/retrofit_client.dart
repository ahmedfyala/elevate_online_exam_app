import 'package:dio/dio.dart';
import 'package:elevate_online_exam_app/features/questions/data/api/model/exam_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/constants/api_constants.dart';

part 'retrofit_client.g.dart';

@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class RetrofitClient {
  @FactoryMethod()
  factory RetrofitClient(Dio dio, {@Named('baseUrl') String? baseUrl}) =
      _RetrofitClient;

  @GET(ApiConstants.examApi)
  Future<ExamResponse> getQuestions(
    @Header('token') String token,
  );
}
