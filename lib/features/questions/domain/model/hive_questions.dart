import 'package:hive/hive.dart';

part 'hive_questions.g.dart';

@HiveType(typeId: 1)
class HiveQuestions {
  @HiveField(0)
  String? questionId;
  @HiveField(1)
  String? question;
  @HiveField(2)
  String? correct;
  @HiveField(3)
  String? type;
  @HiveField(4)
  String? subjectId;
  @HiveField(5)
  String? examId;
  @HiveField(6)
  num? duration;
  @HiveField(7)
  bool? isAnswered;
  @HiveField(8)
  String? selectedAnswer;
  @HiveField(9)
  String? firstOption;
  @HiveField(10)
  String? secondOption;
  @HiveField(11)
  String? thirdOption;
  @HiveField(12)
  String? fourthOption;
  @HiveField(13)
  String? firstOptionKey;
  @HiveField(14)
  String? secondOptionKey;
  @HiveField(15)
  String? thirdOptionKey;
  @HiveField(16)
  String? fourthOptionKey;

  HiveQuestions({
    this.questionId,
    this.question,
    this.correct,
    this.type,
    this.subjectId,
    this.examId,
    this.duration,
    this.isAnswered,
    this.selectedAnswer,
    this.firstOption,
    this.secondOption,
    this.thirdOption,
    this.fourthOption,
    this.firstOptionKey,
    this.secondOptionKey,
    this.thirdOptionKey,
    this.fourthOptionKey,
  });
}
