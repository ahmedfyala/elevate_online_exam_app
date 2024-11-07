import 'package:hive/hive.dart';

import '../../../results/data/model/results_model.dart';

part 'hive_answers.g.dart';

@HiveType(typeId: 5)
class ResultsHive {
  @HiveField(0)
  final num? correct;
  @HiveField(1)
  final num? wrong;
  @HiveField(2)
  final String? total;
  @HiveField(3)
  late final String subjectId;

  ResultsHive({
    this.correct,
    this.wrong,
    this.total,
    required this.subjectId, // Make `subjectId` required in the constructor
  });

  ResultsModel toResultsModel() {
    return ResultsModel(
      correct: correct ?? 0,
      wrong: wrong ?? 0,
      total: total,
      subjectId: subjectId,
    );
  }
}
