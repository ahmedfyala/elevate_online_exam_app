import 'package:json_annotation/json_annotation.dart';

import '../model/exam.dart';
import '../model/subject.dart';
import 'answers.dart';

part 'questions.g.dart';

@JsonSerializable()
class Question {
  Question({
    List<Answers>? answers,
    String? type,
    String? id,
    String? question,
    String? correct,
    Subject? subject,
    Exam? exam,
    String? createdAt,
  }) {
    _answers = answers;
    _type = type;
    _id = id;
    _question = question;
    _correct = correct;
    _subject = subject;
    _exam = exam;
    _createdAt = createdAt;
  }

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
  List<Answers>? _answers;
  String? _type;
  String? _id;
  String? _question;
  String? _correct;
  Subject? _subject;
  Exam? _exam;
  String? _createdAt;

  List<Answers>? get answers => _answers;
  String? get type => _type;
  String? get id => _id;
  String? get question => _question;
  String? get correct => _correct;
  Subject? get subject => _subject;
  Exam? get exam => _exam;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
