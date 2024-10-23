import 'package:elevate_online_exam_app/features/questions/domain/model/hive_answers.dart';
import 'package:elevate_online_exam_app/features/questions/domain/model/hive_questions.dart';
import 'package:elevate_online_exam_app/features/questions/domain/model/hive_selected_answers.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/di/hive_module.dart';
import '../../api/model/response/answers.dart';
import '../../api/model/response/exam.dart';
import '../../api/model/response/questions.dart';
import '../../api/model/response/subject.dart';
import '../contract/exam_datasource.dart';

@Injectable(as: ExamOfflineDatasource)
class ExamOfflineDataSourceImpl implements ExamOfflineDatasource {
  final HiveModule _hiveModule;

  // Inject the HiveModule
  ExamOfflineDataSourceImpl(this._hiveModule);

  @override
  Future<List<Question>> getQuestions() async {
    final Box<QuestionHive> hiveBox = _hiveModule.questionsBox;
    final hiveQuestions = hiveBox.values.toList();

    return hiveQuestions
        .map((hiveQuestion) => Question(
              id: hiveQuestion.questionId ?? '',
              question: hiveQuestion.question ?? '',
              correct: hiveQuestion.correct ?? '',
              type: hiveQuestion.type ?? '',
              subject: hiveQuestion.subjectId != null
                  ? Subject(
                      id: hiveQuestion.subjectId!,
                      name: hiveQuestion.subjectName,
                    )
                  : null,
              exam: hiveQuestion.examId != null
                  ? Exam(
                      id: hiveQuestion.examId!,
                      duration: hiveQuestion.duration,
                      title: hiveQuestion.examName,
                    )
                  : null,
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
    final questionId = question.id.toString();
    final Box<QuestionHive> hiveBox = _hiveModule.questionsBox;

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

    final hiveQuestion = QuestionHive(
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
      subjectName: question.subject?.name,
      examName: question.exam?.title,
    );

    await hiveBox.put(questionId, hiveQuestion);
    print('Saved question with id $questionId');
  }

  @override
  Future<List<ResultsHive>> getAnswersResult() async {
    final Box<ResultsHive> answersBox = _hiveModule.answersBox;
    return answersBox.values.toList();
  }

  @override
  Future<void> saveAnswersResult(ResultsHive hiveAnswers) async {
    print(
        'exam offline datasource saveAnswersResult${hiveAnswers.wrong! + hiveAnswers.correct!}');
    final Box<ResultsHive> answersBox = _hiveModule.answersBox;
    final hiveAnswersId = hiveAnswers.subjectId.toString();
    answersBox.delete(hiveAnswersId);
    await answersBox.put(hiveAnswersId, hiveAnswers);
  }

  @override
  Future<List<SelectedAnswersHive>> getSelectedAnswers() async {
    final Box<SelectedAnswersHive> selectedAnswersBox =
        _hiveModule.selectedAnswersBox;
    return selectedAnswersBox.values.toList();
  }

  @override
  Future<void> saveSelectedAnswers(
      SelectedAnswersHive hiveSelectedAnswers) async {
    final Box<SelectedAnswersHive> selectedAnswersBox =
        _hiveModule.selectedAnswersBox;
    final hiveSelectedAnswersId = hiveSelectedAnswers.questionId.toString();

    await selectedAnswersBox.put(hiveSelectedAnswersId, hiveSelectedAnswers);
    print('Saved selected answers with id $hiveSelectedAnswersId');
  }
}
