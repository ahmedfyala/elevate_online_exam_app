import 'package:json_annotation/json_annotation.dart';

part 'wrong_questions.g.dart';

@JsonSerializable()
class WrongQuestions {
  WrongQuestions({
    String? qid,
    String? question,
    String? inCorrectAnswer,
    String? correctAnswer,
    dynamic answers,
  }) {
    _qid = qid;
    _question = question;
    _inCorrectAnswer = inCorrectAnswer;
    _correctAnswer = correctAnswer;
    _answers = answers;
  }

  factory WrongQuestions.fromJson(Map<String, dynamic> json) =>
      _$WrongQuestionsFromJson(json);
  String? _qid;
  String? _question;
  String? _inCorrectAnswer;
  String? _correctAnswer;
  dynamic _answers;

  String? get qid => _qid;
  String? get question => _question;
  String? get inCorrectAnswer => _inCorrectAnswer;
  String? get correctAnswer => _correctAnswer;
  dynamic get answers => _answers;

  Map<String, dynamic> toJson() => _$WrongQuestionsToJson(this);
}
