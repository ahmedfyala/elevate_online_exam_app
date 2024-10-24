import 'package:json_annotation/json_annotation.dart';

part 'correct_questions.g.dart';

@JsonSerializable()
class CorrectQuestions {
  CorrectQuestions({
    String? qid,
    String? question,
    String? correctAnswer,
    dynamic answers,
  }) {
    _qid = qid;
    _question = question;
    _correctAnswer = correctAnswer;
    _answers = answers;
  }

  factory CorrectQuestions.fromJson(Map<String, dynamic> json) =>
      _$CorrectQuestionsFromJson(json);
  String? _qid;
  String? _question;
  String? _correctAnswer;
  dynamic _answers;

  String? get qid => _qid;
  String? get question => _question;
  String? get correctAnswer => _correctAnswer;
  dynamic get answers => _answers;

  Map<String, dynamic> toJson() => _$CorrectQuestionsToJson(this);
}
