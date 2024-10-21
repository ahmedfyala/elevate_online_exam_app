import 'package:json_annotation/json_annotation.dart';

part 'exam.g.dart';

@JsonSerializable()
class Exam {
  Exam({
    String? id,
    String? title,
    num? duration,
    String? subject,
    num? numberOfQuestions,
    bool? active,
    String? createdAt,
  }) {
    _id = id;
    _title = title;
    _duration = duration;
    _subject = subject;
    _numberOfQuestions = numberOfQuestions;
    _active = active;
    _createdAt = createdAt;
  }

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);

  String? _id;
  String? _title;
  num? _duration;
  String? _subject;
  num? _numberOfQuestions;
  bool? _active;
  String? _createdAt;

  String? get id => _id;
  String? get title => _title;
  num? get duration => _duration;
  String? get subject => _subject;
  num? get numberOfQuestions => _numberOfQuestions;
  bool? get active => _active;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() => _$ExamToJson(this);
}
