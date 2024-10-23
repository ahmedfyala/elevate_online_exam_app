import 'package:injectable/injectable.dart';

import '../../../core/error_handeling/Result.dart';
import '../data/api/model/response/check_answer_response.dart';
import '../domain/contract/repository/exam_repository.dart';
import '../domain/model/answer_model.dart';

@injectable
class CheckAnswersUseCase {
  final ExamRepository _questionsRepository;

  CheckAnswersUseCase(this._questionsRepository);

  Future<Result<CheckAnswerResponse>> checkAnswer(
      List<AnswerModel> answerModel) async {
    return await _questionsRepository.checkAnswer(answerModel);
  }

  Future<void> saveAnswersResult(
      CheckAnswerResponse checkAnswerResponse, String subjectId) async {
    print(
        'checkAnswerUseCase: ${checkAnswerResponse.correct! + checkAnswerResponse.wrong!}');
    return await _questionsRepository.saveAnswersResult(
        checkAnswerResponse, subjectId);
  }

  Future<void> saveSelectedAnswers(List<AnswerModel> answerModel) async {
    return await _questionsRepository.saveSelectedAnswers(answerModel);
  }
}
