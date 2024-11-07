import 'package:elevate_online_exam_app/features/questions/data/api/model/response/wrong_questions.dart';
import 'package:elevate_online_exam_app/features/questions/domain/model/hive_answers.dart';
import 'package:json_annotation/json_annotation.dart';

import 'correct_questions.dart';

part 'check_answer_response.g.dart';

@JsonSerializable()
class CheckAnswerResponse {
  CheckAnswerResponse({
    String? message,
    num? correct,
    num? wrong,
    String? total,
    List<WrongQuestions>? wrongQuestions,
    List<CorrectQuestions>? correctQuestions,
  }) {
    _message = message;
    _correct = correct;
    _wrong = wrong;
    _total = total;
    _wrongQuestions = wrongQuestions;
    _correctQuestions = correctQuestions;
  }

  factory CheckAnswerResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckAnswerResponseFromJson(json);
  String? _message;
  num? _correct;
  num? _wrong;
  String? _total;
  List<WrongQuestions>? _wrongQuestions;
  List<CorrectQuestions>? _correctQuestions;

  String? get message => _message;
  num? get correct => _correct;
  num? get wrong => _wrong;
  String? get total => _total;
  List<WrongQuestions>? get wrongQuestions => _wrongQuestions;
  List<CorrectQuestions>? get correctQuestions => _correctQuestions;

  Map<String, dynamic> toJson() => _$CheckAnswerResponseToJson(this);
  ResultsHive toHiveAnswers({required String subjectId}) {
    return ResultsHive(
      subjectId: subjectId,
      correct: correct,
      wrong: wrong,
      total: total,
    );
  }
}
