import 'package:elevate_online_exam_app/features/questions/data/api/model/questions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ExamResponse {
  ExamResponse({
    String? message,
    List<Question>? questions,
  }) {
    _message = message;
    _questions = questions;
  }

  factory ExamResponse.fromJson(Map<String, dynamic> json) =>
      _$ExamResponseFromJson(json);
  String? _message;
  List<Question>? _questions;

  String? get message => _message;
  List<Question>? get questions => _questions;

  Map<String, dynamic> toJson() => _$ExamResponseToJson(this);
}
