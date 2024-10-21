import 'package:elevate_online_exam_app/features/questions/data/api/model/answers.dart';
import 'package:elevate_online_exam_app/features/questions/data/api/model/questions.dart';
import 'package:elevate_online_exam_app/features/questions/domain/model/hive_questions.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../api/model/exam.dart';
import '../../api/model/subject.dart';
import '../contract/exam_datasource.dart';

@Injectable(as: ExamOfflineDatasource)
class ExamOfflineDataSourceImpl implements ExamOfflineDatasource {
  final Box<HiveQuestions> _hiveBox;

  // Inject the Hive Box in the constructor
  ExamOfflineDataSourceImpl(this._hiveBox);

  @override
  Future<List<Question>> getQuestions() async {
    final hiveQuestions = _hiveBox.values.toList();
    return hiveQuestions
        .map((hiveQuestion) => Question(
                id: hiveQuestion.questionId,
                question: hiveQuestion.question,
                correct: hiveQuestion.correct,
                type: hiveQuestion.type,
                subject: Subject(
                    id: hiveQuestion
                        .subjectId), // Assuming Subject is mapped this way
                exam: Exam(id: hiveQuestion.examId),
                // Assuming Exam is mapped this way
                answers: [
                  Answers(
                    answer: hiveQuestion.firstOption,
                    key: hiveQuestion.firstOptionKey,
                  ),
                  Answers(
                    answer: hiveQuestion.secondOption,
                    key: hiveQuestion.secondOptionKey,
                  ),
                  Answers(
                    answer: hiveQuestion.thirdOption,
                    key: hiveQuestion.thirdOptionKey,
                  ),
                  Answers(
                    answer: hiveQuestion.fourthOption,
                    key: hiveQuestion.fourthOptionKey,
                  ),
                ]
                // Add other fields as needed
                ))
        .toList();
  }

  @override
  Future<void> saveQuestions(Question question) async {
    final hiveQuestion = HiveQuestions(
      questionId: question.id,
      question: question.question,
      correct: question.correct,
      type: question.type,
      subjectId: question.subject?.id,
      examId: question.exam?.id,
      duration: question.exam!.duration,
      firstOption: question.answers?[0].answer,
      secondOption: question.answers?[1].answer,
      thirdOption: question.answers?[2].answer,
      fourthOption: question.answers?[3].answer,
      firstOptionKey: question.answers?[0].key,
      secondOptionKey: question.answers?[1].key,
      thirdOptionKey: question.answers?[2].key,
      fourthOptionKey: question.answers?[3].key,

      // Add other fields as needed
    );
    await _hiveBox.put(question.id, hiveQuestion);
  }
}
