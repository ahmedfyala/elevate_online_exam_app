import 'package:elevate_online_exam_app/features/questions/domain/model/exam_model.dart';

sealed class ExamQuestionsState {}

class InitialState extends ExamQuestionsState {}

class LoadingState extends ExamQuestionsState {}

class ErrorState extends ExamQuestionsState {
  final Exception? exception;
  ErrorState(this.exception);
}

class SuccessState extends ExamQuestionsState {
  final List<ExamModel>? questions;
  SuccessState(this.questions);
}
