import '../../../data/model/question_model.dart';
import '../../../data/model/results_model.dart';
import '../../../data/model/selected_answers_model.dart';

sealed class HomeResultState {}

class HomeResultInitial extends HomeResultState {}

class HomeResultLoading extends HomeResultState {}

class HomeResultError extends HomeResultState {
  final Exception? exception;
  HomeResultError(this.exception);
}

class HomeResultSuccess extends HomeResultState {
  final List<ResultsModel> results;
  final List<QuestionModel> questions;
  final List<SelectedAnswersModel> selectedAnswers;
  final Map<String, int> subjectCorrectAnswers;
  final Map<String, int> subjectTotalQuestions;

  HomeResultSuccess({
    required this.results,
    required this.questions,
    required this.selectedAnswers,
    required this.subjectCorrectAnswers,
    required this.subjectTotalQuestions,
  });
}
