import 'package:json_annotation/json_annotation.dart';

import 'answers_request.dart';

part 'check_answer_request.g.dart';

@JsonSerializable()
class CheckAnswerRequest {
  CheckAnswerRequest({
    List<AnswersRequest>? answers,
  }) {
    _answers = answers;
  }

  factory CheckAnswerRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckAnswerRequestFromJson(json);
  List<AnswersRequest>? _answers;

  List<AnswersRequest>? get answers => _answers;

  Map<String, dynamic> toJson() => _$CheckAnswerRequestToJson(this);
}
