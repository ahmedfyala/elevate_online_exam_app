import 'package:elevate_online_exam_app/core/error_handeling/Result.dart';
import 'package:elevate_online_exam_app/features/questions/data/api/model/request/check_answer_request.dart';
import 'package:elevate_online_exam_app/features/questions/data/api/model/response/check_answer_response.dart';
import 'package:elevate_online_exam_app/features/questions/data/api/retrofit_client.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/api_executer/api_extensions.dart';
import '../../api/model/response/exam_response.dart';
import '../contract/exam_datasource.dart';

@Injectable(as: ExamOnlineDatasource)
class ExamOnlineDataSourceImpl extends ExamOnlineDatasource {
  final RetrofitClient retrofitClient;

  ExamOnlineDataSourceImpl(this.retrofitClient);

  @override
  Future<Result<ExamResponse>> getQuestions(String token) async {
    return executeApi<ExamResponse>(
      () async {
        var result = await retrofitClient.getQuestions(token);
        print('the online questions are ${result.questions}');
        return Success(data: result);
      },
    );
  }

  @override
  Future<Result<CheckAnswerResponse>> checkAnswers(
      String token, CheckAnswerRequest checkAnswerRequest) async {
    return executeApi<CheckAnswerResponse>(
      () async {
        var result =
            await retrofitClient.checkAnswer(token, checkAnswerRequest);
        return Success(data: result);
      },
    );
  }
}
