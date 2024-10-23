import 'package:json_annotation/json_annotation.dart';

part 'answers_request.g.dart';

@JsonSerializable()
class AnswersRequest {
  AnswersRequest({
    String? questionId,
    String? correct,
  }) {
    _questionId = questionId;
    _correct = correct;
  }

  factory AnswersRequest.fromJson(Map<String, dynamic> json) =>
      _$AnswersRequestFromJson(json);
  String? _questionId;
  String? _correct;

  String? get questionId => _questionId;
  String? get correct => _correct;

  Map<String, dynamic> toJson() => _$AnswersRequestToJson(this);
}
