import 'package:hive/hive.dart';

part 'hive_answers.g.dart';

@HiveType(typeId: 1)
class HiveAnswers {
  @HiveField(0)
  String questionId;

  @HiveField(1)
  String answer;

  HiveAnswers({
    required this.questionId,
    required this.answer,
  });
}
