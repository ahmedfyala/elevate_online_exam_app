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
}
