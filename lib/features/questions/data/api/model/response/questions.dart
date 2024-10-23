import 'package:json_annotation/json_annotation.dart';

import 'answers.dart';
import 'exam.dart';
import 'subject.dart';

part 'questions.g.dart';

@JsonSerializable()
class Question {
  Question({
    required this.answers,
    required this.type,
    required this.id,
    required this.question,
    required this.correct,
    required this.subject,
    required this.exam,
    this.createdAt,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  @JsonKey(name: 'answers')
  final List<Answers> answers;

  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: '_id')
  final String id;

  final String? question;
  final String? correct;
  final Subject? subject;
  final Exam? exam;
  final String? createdAt;

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
