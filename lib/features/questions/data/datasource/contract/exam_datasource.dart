import 'package:elevate_online_exam_app/core/error_handeling/Result.dart';
import 'package:elevate_online_exam_app/features/questions/data/api/model/questions.dart';

import '../../api/model/exam_response.dart';

abstract class ExamOnlineDatasource {
  Future<Result<ExamResponse>> getQuestions(String token);
}

abstract class ExamOfflineDatasource {
  Future<void> saveQuestions(Question question);
  Future<List<Question>> getQuestions();
}
