import 'package:elevate_online_exam_app/core/error_handeling/Result.dart';
import 'package:elevate_online_exam_app/features/questions/data/api/retrofit_client.dart';
import 'package:elevate_online_exam_app/features/questions/domain/model/exam_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/api_executer/api_extensions.dart';
import '../../api/model/questions.dart';
import '../contract/exam_datasource.dart';

@Injectable(as: ExamOnlineDatasource)
class ExamOnlineDataSourceImpl extends ExamOnlineDatasource {
  final RetrofitClient retrofitClient;

  ExamOnlineDataSourceImpl(this.retrofitClient);

  @override
  Future<Result<List<ExamModel>>> getQuestions(String token) async {
    return executeApi<List<ExamModel>>(
      () async {
        var result = await retrofitClient.getQuestions(token);
        List<Question>? questions = result.questions;
        List<ExamModel>? examModels =
            questions?.map((question) => question.toExamModel()).toList();
        return Success(data: examModels);
      },
    );
  }
}
