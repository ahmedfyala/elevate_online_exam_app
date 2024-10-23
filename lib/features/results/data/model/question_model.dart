import 'package:elevate_online_exam_app/features/questions/domain/model/hive_questions.dart';

class QuestionModel {
  final String? questionId;
  final String? question;
  final String? correct;
  final String? subjectId;
  final String? examId;
  final num? duration;
  final String? firstOption;
  final String? secondOption;
  final String? thirdOption;
  final String? fourthOption;
  final String? firstOptionKey;
  final String? secondOptionKey;
  final String? thirdOptionKey;
  final String? fourthOptionKey;
  final String? examName;
  final String? subjectName;

  QuestionModel({
    this.questionId,
    this.question,
    this.correct,
    this.subjectId,
    this.examId,
    this.duration,
    this.firstOption,
    this.secondOption,
    this.thirdOption,
    this.fourthOption,
    this.firstOptionKey,
    this.secondOptionKey,
    this.thirdOptionKey,
    this.fourthOptionKey,
    this.examName,
    this.subjectName,
  });

  QuestionHive toHiveQuestions() {
    return QuestionHive(
      questionId: questionId,
      question: question,
      correct: correct,
      subjectId: subjectId,
      examId: examId,
      duration: duration,
      firstOption: firstOption,
      secondOption: secondOption,
      thirdOption: thirdOption,
      fourthOption: fourthOption,
      firstOptionKey: firstOptionKey,
      secondOptionKey: secondOptionKey,
      thirdOptionKey: thirdOptionKey,
      fourthOptionKey: fourthOptionKey,
      examName: examName,
      subjectName: subjectName,
    );
  }
}
