import '../../../../../core/error_handeling/Result.dart';
import '../../../data/api/model/exam_response.dart';

abstract class ExamRepository {
  Future<Result<ExamResponse>> getQuestions(String token);
}
