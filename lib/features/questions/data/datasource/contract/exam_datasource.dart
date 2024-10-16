import 'package:elevate_online_exam_app/core/error_handeling/Result.dart';
import 'package:elevate_online_exam_app/features/questions/domain/model/exam_model.dart';

abstract class ExamOnlineDatasource {
  Future<Result<List<ExamModel>>> getQuestions(String token);
}

abstract class AuthOfflineDataSource {}
