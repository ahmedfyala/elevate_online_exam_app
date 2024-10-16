import 'package:elevate_online_exam_app/core/error_handeling/Result.dart';
import 'package:elevate_online_exam_app/features/questions/data/api/model/exam_response.dart';
import 'package:elevate_online_exam_app/features/questions/data/api/retrofit_client.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/api_executer/api_extensions.dart';
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

        return Success(data: result);
      },
    );
  }
}
