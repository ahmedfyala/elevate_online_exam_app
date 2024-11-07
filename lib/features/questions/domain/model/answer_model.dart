import 'package:elevate_online_exam_app/features/questions/domain/model/hive_selected_answers.dart';

class AnswerModel {
  final String? questionId;
  late final String? selectedAnswer;

  AnswerModel({required this.questionId, required this.selectedAnswer});

  Map<String, dynamic> toJson() {
    return {
      'questionId': questionId,
      'selectedAnswer': selectedAnswer,
    };
  }

  toAnswerRequest() {
    return {
      'qid': questionId,
      'answer': selectedAnswer,
    };
  }

  SelectedAnswersHive toHiveSelectedAnswers() {
    return SelectedAnswersHive(
      questionId: questionId,
      selectedAnswer: selectedAnswer,
    );
  }

  toAnswerRequest() {
    return {
      'qid': questionId,
      'answer': selectedAnswer,
    };
  }
}
