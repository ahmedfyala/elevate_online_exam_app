import 'package:elevate_online_exam_app/features/questions/domain/model/hive_selected_answers.dart';

class SelectedAnswersModel {
  final String? questionId;
  final String? selectedAnswer;

  SelectedAnswersModel({
    this.questionId,
    this.selectedAnswer,
  });

  factory SelectedAnswersModel.fromHive(
      SelectedAnswersHive hiveSelectedAnswers) {
    return SelectedAnswersModel(
      questionId: hiveSelectedAnswers.questionId,
      selectedAnswer: hiveSelectedAnswers.selectedAnswer,
    );
  }

  SelectedAnswersHive toHive() {
    return SelectedAnswersHive(
      questionId: questionId,
      selectedAnswer: selectedAnswer,
    );
  }
}
