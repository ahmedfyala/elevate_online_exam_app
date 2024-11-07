import 'package:elevate_online_exam_app/core/error_handeling/Result.dart';
import 'package:elevate_online_exam_app/features/questions/data/api/model/request/check_answer_request.dart';
import 'package:elevate_online_exam_app/features/questions/data/api/model/response/check_answer_response.dart';
import 'package:elevate_online_exam_app/features/questions/domain/model/hive_selected_answers.dart';

import '../../../domain/model/hive_answers.dart';
import '../../api/model/response/exam_response.dart';
import '../../api/model/response/questions.dart';

abstract class ExamOnlineDatasource {
  Future<Result<ExamResponse>> getQuestions(String token);
  Future<Result<CheckAnswerResponse>> checkAnswers(
      String token, CheckAnswerRequest checkAnswerRequest);
}

abstract class ExamOfflineDatasource {
  Future<void> saveQuestions(Question question);
  Future<List<Question>> getQuestions();
  Future<void> saveAnswersResult(ResultsHive hiveAnswers);
  Future<List<ResultsHive>> getAnswersResult();
  Future<void> saveSelectedAnswers(SelectedAnswersHive hiveSelectedAnswers);
  Future<List<SelectedAnswersHive>> getSelectedAnswers();
}
