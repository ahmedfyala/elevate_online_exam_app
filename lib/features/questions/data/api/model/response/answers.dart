import 'package:json_annotation/json_annotation.dart';

part 'answers.g.dart';

@JsonSerializable()
class Answers {
  Answers({
    String? answer,
    String? key,
  }) {
    _answer = answer;
    _key = key;
  }

  factory Answers.fromJson(Map<String, dynamic> json) =>
      _$AnswersFromJson(json);
  String? _answer;
  String? _key;

  String? get answer => _answer;
  String? get key => _key;

  Map<String, dynamic> toJson() => _$AnswersToJson(this);
}
