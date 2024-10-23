import '../../../data/api/model/response/questions.dart';

sealed class ExamQuestionsState {}

class InitialState extends ExamQuestionsState {}

class LoadingState extends ExamQuestionsState {}

class ErrorState extends ExamQuestionsState {
  final Exception? exception;
  ErrorState(this.exception);
}

class SuccessState extends ExamQuestionsState {
  final List<Question>? questions;
  SuccessState(this.questions);
}

class FinishState extends ExamQuestionsState {}

class NextQuestionState extends ExamQuestionsState {}

class PreviousQuestionState extends ExamQuestionsState {}

class SelectedOptionState extends ExamQuestionsState {
  final String? selectedOption;
  SelectedOptionState(this.selectedOption);
}

class SubmitSuccessState extends ExamQuestionsState {
  final String message;

  SubmitSuccessState(this.message);
}
