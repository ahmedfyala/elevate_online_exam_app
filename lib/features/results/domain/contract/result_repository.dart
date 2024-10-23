import '../../data/model/question_model.dart';
import '../../data/model/results_model.dart';
import '../../data/model/selected_answers_model.dart';

abstract class ResultRepository {
  Future<List<QuestionModel>> getQuestions();
  Future<List<ResultsModel>> getResults();
  Future<List<SelectedAnswersModel>> getSelectedAnswers();
}
