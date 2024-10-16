import 'package:elevate_online_exam_app/core/error_handeling/Result.dart';

import '../../api/model/exam_response.dart';

abstract class ExamOnlineDatasource {
  Future<Result<ExamResponse>> getQuestions(String token);
}

abstract class AuthOfflineDataSource {}
