import 'package:elevate_online_exam_app/features/questions/data/api/model/subject.dart';
import 'package:elevate_online_exam_app/features/questions/domain/model/exam_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'exam.dart';

part 'questions.g.dart';

@JsonSerializable()
class Question {
  @JsonKey(name: '_id')
  final String id;
  final String question;
  final String A1;
  final String A2;
  final String A3;
  final String? A4;
  final String correct;
  final Subject subject;
  final Exam exam;

  Question({
    required this.id,
    required this.question,
    required this.A1,
    required this.A2,
    required this.A3,
    this.A4,
    required this.correct,
    required this.subject,
    required this.exam,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  ExamModel toExamModel() {
    return ExamModel(
      question: question,
      firstChoice: A1,
      secondChoice: A2,
      thirdChoice: A3,
      fourthChoice: A4,
      correctAnswer: correct,
      subjectId: subject.name,
      examId: exam.id,
      examDuration: exam.duration,
      examNumberOfQuestions: exam.numberOfQuestions,
      examTitle: exam.title,
    );
  }
}
