import 'package:elevate_online_exam_app/core/error_handeling/Result.dart';
import 'package:elevate_online_exam_app/features/questions/data/datasource/contract/exam_datasource.dart';
import 'package:elevate_online_exam_app/features/questions/domain/contract/repository/exam_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../auth/data/datasource/contracts/auth_datasource.dart';
import '../api/model/exam_response.dart';

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
    }
    var offlineQuestions = await examOfflineDatasource.getQuestions();
    print('the offline questions are $offlineQuestions');
    return response;
  }
}
