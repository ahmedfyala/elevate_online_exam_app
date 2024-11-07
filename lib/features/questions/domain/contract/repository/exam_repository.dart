import 'package:elevate_online_exam_app/features/questions/domain/model/answer_model.dart';

import '../../../../../core/error_handeling/Result.dart';
import '../../../data/api/model/response/check_answer_response.dart';
import '../../../data/api/model/response/exam_response.dart';

abstract class ExamRepository {
  Future<Result<ExamResponse>> getQuestions();
  Future<Result<CheckAnswerResponse>> checkAnswer(
      List<AnswerModel> answerModel);
  Future<void> saveAnswersResult(
      CheckAnswerResponse checkAnswerResponse, String subjectId);
  Future<void> saveSelectedAnswers(List<AnswerModel> answerModel);
}
