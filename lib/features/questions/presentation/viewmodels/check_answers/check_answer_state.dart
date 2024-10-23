import 'package:elevate_online_exam_app/features/questions/data/api/model/response/check_answer_response.dart';

sealed class CheckAnswerState {}

class CheckAnswerInitial extends CheckAnswerState {}

class CheckAnswerLoading extends CheckAnswerState {}

class CheckAnswerError extends CheckAnswerState {
  final Exception? exception;
  CheckAnswerError(this.exception);
}

class CheckAnswerSuccess extends CheckAnswerState {
  final CheckAnswerResponse? answers;

  CheckAnswerSuccess(this.answers);
}

class CheckAnswerFinish extends CheckAnswerState {}
