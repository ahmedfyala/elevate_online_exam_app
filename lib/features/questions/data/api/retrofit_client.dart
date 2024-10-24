import 'package:dio/dio.dart';
import 'package:elevate_online_exam_app/features/questions/data/api/model/response/check_answer_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/constants/api_constants.dart';
import 'model/request/check_answer_request.dart';
import 'model/response/exam_response.dart';

part 'retrofit_client.g.dart';

@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class RetrofitClient {
  @FactoryMethod()
  factory RetrofitClient(Dio dio, {@Named('baseUrl') String? baseUrl}) =
      _RetrofitClient;

  @GET(ApiConstants.questionsApi)
  Future<ExamResponse> getQuestions(
    @Header('token') String token,
  );

  @POST(ApiConstants.questionsCheckApi)
  Future<CheckAnswerResponse> checkAnswer(
    @Header('token') String token,
    @Body() CheckAnswerRequest checkAnswerRequest,
  );
}
