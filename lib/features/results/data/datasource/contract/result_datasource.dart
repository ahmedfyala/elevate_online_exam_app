import 'package:elevate_online_exam_app/features/results/data/model/question_model.dart';
import 'package:elevate_online_exam_app/features/results/data/model/results_model.dart';
import 'package:elevate_online_exam_app/features/results/data/model/selected_answers_model.dart';

abstract class ResultOfflineDataSource {
  Future<List<ResultsModel>> getResults();
  Future<List<QuestionModel>> getQuestions();
  Future<List<SelectedAnswersModel>> getSelectedAnswers();
}
