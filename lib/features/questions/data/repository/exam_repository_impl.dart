import 'package:elevate_online_exam_app/core/error_handeling/Result.dart';
import 'package:elevate_online_exam_app/features/questions/data/api/model/request/check_answer_request.dart';
import 'package:elevate_online_exam_app/features/questions/data/api/model/response/check_answer_response.dart';
import 'package:elevate_online_exam_app/features/questions/data/datasource/contract/exam_datasource.dart';
import 'package:elevate_online_exam_app/features/questions/domain/contract/repository/exam_repository.dart';
import 'package:elevate_online_exam_app/features/questions/domain/model/answer_model.dart';
import 'package:injectable/injectable.dart';

import '../../../auth/data/datasource/contracts/auth_datasource.dart';
import '../api/model/request/answers_request.dart';
import '../api/model/response/exam_response.dart';

@Injectable(as: ExamRepository)
class ExamRepositoryImpl implements ExamRepository {
  ExamOnlineDatasource examOnlineDatasource;
  ExamOfflineDatasource examOfflineDatasource;
  AuthOfflineDataSource authOfflineDataSource;

  ExamRepositoryImpl(this.examOnlineDatasource, this.examOfflineDatasource,
      this.authOfflineDataSource);

  @override
  Future<Result<ExamResponse>> getQuestions() async {
    var user = await authOfflineDataSource.getUser();
    var response = await examOnlineDatasource.getQuestions(user!.token!);

    if (response is Success<ExamResponse>) {
      for (var question in response.data?.questions ?? []) {
        await examOfflineDatasource.saveQuestions(question);
      }
      var offlineQuestions = await examOfflineDatasource.getQuestions();
      print('the offline questions are $offlineQuestions');
      print('the online questions are ${response.data?.questions}');
      return response;
    } else {
      return response;
    }
  }

  @override
  Future<Result<CheckAnswerResponse>> checkAnswer(
      List<AnswerModel> answerModels) async {
    var user = await authOfflineDataSource.getUser();

    List<AnswersRequest> answersRequests = answerModels.map((answerModel) {
      return AnswersRequest(
        questionId: answerModel.questionId,
        correct: answerModel.selectedAnswer,
      );
    }).toList();

    var checkAnswerRequest = CheckAnswerRequest(
      answers: answersRequests,
    );

    var response = await examOnlineDatasource.checkAnswers(
        user!.token!, checkAnswerRequest);

    return response;
  }

  @override
  Future<void> saveAnswersResult(
      CheckAnswerResponse checkAnswerResponse, String subjectId) async {
    var hiveAnswers = checkAnswerResponse.toHiveAnswers(
        subjectId: subjectId); // pass subjectId here
    print('exam repository ${hiveAnswers.wrong! + hiveAnswers.correct!}');
    await examOfflineDatasource.saveAnswersResult(hiveAnswers);
  }

  @override
  Future<void> saveSelectedAnswers(List<AnswerModel> answerModel) async {
    for (var answer in answerModel) {
      var hiveSelectedAnswers = answer.toHiveSelectedAnswers();
      await examOfflineDatasource.saveSelectedAnswers(hiveSelectedAnswers);
    }
  }
}
