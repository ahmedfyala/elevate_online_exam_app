import 'package:json_annotation/json_annotation.dart';

part 'exam.g.dart';

@JsonSerializable()
class Exam {
  @JsonKey(name: '_id')
  final String id;
  final String title;
  final int duration;
  @JsonKey(name: 'subject')
  final String subjectId;
  final int numberOfQuestions;
  final bool active;
  final DateTime createdAt;

  Exam({
    required this.id,
    required this.title,
    required this.duration,
    required this.subjectId,
    required this.numberOfQuestions,
    required this.active,
    required this.createdAt,
  });

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);

  Map<String, dynamic> toJson() => _$ExamToJson(this);
}
