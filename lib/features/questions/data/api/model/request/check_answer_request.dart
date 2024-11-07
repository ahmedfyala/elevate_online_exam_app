import 'package:json_annotation/json_annotation.dart';

import 'answers_request.dart';

part 'check_answer_request.g.dart';

@JsonSerializable()
class CheckAnswerRequest {
  CheckAnswerRequest({
    List<AnswersRequest>? answers,
    int? time,
  }) {
    _answers = answers;
    _time = time;
  }

  factory CheckAnswerRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckAnswerRequestFromJson(json);

  List<AnswersRequest>? _answers;
  int? _time;

  List<AnswersRequest>? get answers => _answers;
  int? get time => _time;

  Map<String, dynamic> toJson() => _$CheckAnswerRequestToJson(this);
}
