import 'package:elevate_online_exam_app/features/questions/domain/model/hive_questions.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../api/model/response/answers.dart';
import '../../api/model/response/exam.dart';
import '../../api/model/response/questions.dart';
import '../../api/model/response/subject.dart';
import '../contract/exam_datasource.dart';

@Injectable(as: ExamOfflineDatasource)
class ExamOfflineDataSourceImpl implements ExamOfflineDatasource {
  final Box<HiveQuestions> _hiveBox;

  ExamOfflineDataSourceImpl(this._hiveBox);

  @override
  Future<List<Question>> getQuestions() async {
    final hiveQuestions = _hiveBox.values.toList();
    return hiveQuestions
        .map((hiveQuestion) => Question(
              id: hiveQuestion.questionId ??
                  '', // Provide fallback value if null
              question: hiveQuestion.question ?? '', // Provide fallback value
              correct: hiveQuestion.correct ?? '', // Provide fallback value
              type: hiveQuestion.type ?? '', // Provide fallback value
              subject: hiveQuestion.subjectId != null
                  ? Subject(id: hiveQuestion.subjectId!)
                  : null, // Handle nullable subjectId
              exam: hiveQuestion.examId != null
                  ? Exam(
                      id: hiveQuestion.examId!, duration: hiveQuestion.duration)
                  : null, // Handle nullable examId and duration
              answers: [
                Answers(
                    answer: hiveQuestion.firstOption ?? '',
                    key: hiveQuestion.firstOptionKey ?? ''),
                Answers(
                    answer: hiveQuestion.secondOption ?? '',
                    key: hiveQuestion.secondOptionKey ?? ''),
                Answers(
                    answer: hiveQuestion.thirdOption ?? '',
                    key: hiveQuestion.thirdOptionKey ?? ''),
                Answers(
                    answer: hiveQuestion.fourthOption ?? '',
                    key: hiveQuestion.fourthOptionKey ?? ''),
              ],
            ))
        .toList();
  }

  @override
  Future<void> saveQuestions(Question question) async {
    // Convert the question ID to a string (or ensure it's a valid key type)
    final questionId = question.id.toString();

    // Check if the question already exists in the Hive box
    if (_hiveBox.containsKey(questionId)) {
      if (kDebugMode) {
        print('Question with id $questionId already exists, skipping save.');
      }
      return; // Skip saving if it already exists
    }

    // Safely access the list of answers and handle cases where the list is null or contains fewer than 4 answers
    final firstAnswer =
        question.answers.isNotEmpty ? question.answers[0].answer : null;
    final secondAnswer =
        question.answers.length > 1 ? question.answers[1].answer : null;
    final thirdAnswer =
        question.answers.length > 2 ? question.answers[2].answer : null;
    final fourthAnswer =
        question.answers.length > 3 ? question.answers[3].answer : null;

    final firstKey =
        question.answers.isNotEmpty ? question.answers[0].key : null;
    final secondKey =
        question.answers.length > 1 ? question.answers[1].key : null;
    final thirdKey =
        question.answers.length > 2 ? question.answers[2].key : null;
    final fourthKey =
        question.answers.length > 3 ? question.answers[3].key : null;

    // Map the data to HiveQuestions
    final hiveQuestion = HiveQuestions(
      questionId: question.id,
      question: question.question,
      correct: question.correct,
      type: question.type,
      subjectId: question.subject?.id,
      examId: question.exam?.id,
      duration: question.exam?.duration,
      firstOption: firstAnswer,
      secondOption: secondAnswer,
      thirdOption: thirdAnswer,
      fourthOption: fourthAnswer,
      firstOptionKey: firstKey,
      secondOptionKey: secondKey,
      thirdOptionKey: thirdKey,
      fourthOptionKey: fourthKey,
    );

    // Save the question in Hive
    await _hiveBox.put(questionId, hiveQuestion);
    print('Saved question with id $questionId');
  }
}
