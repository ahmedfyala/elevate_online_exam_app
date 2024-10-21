class AnswerModel {
  final String questionId;
  final String selectedAnswer;

  AnswerModel({required this.questionId, required this.selectedAnswer});

  Map<String, dynamic> toJson() {
    return {
      'questionId': questionId,
      'selectedAnswer': selectedAnswer,
    };
  }
}
