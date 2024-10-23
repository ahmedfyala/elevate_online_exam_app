import 'package:elevate_online_exam_app/features/questions/domain/model/hive_answers.dart';

class ResultsModel {
  final num? correct;
  final num? wrong;
  final String? total;
  final String? subjectId;

  ResultsModel({this.correct, this.wrong, this.total, this.subjectId});

  ResultsHive toHiveAnswers() {
    return ResultsHive(
        correct: correct, wrong: wrong, total: total, subjectId: subjectId!);
  }
}
