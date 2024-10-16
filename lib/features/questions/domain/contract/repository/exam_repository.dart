import 'package:elevate_online_exam_app/features/questions/domain/model/exam_model.dart';

import '../../../../../core/error_handeling/Result.dart';

abstract class ExamRepository {
  Future<Result<List<ExamModel>>> getQuestions(String token);
}
