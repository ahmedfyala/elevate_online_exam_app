import 'package:elevate_online_exam_app/core/error_handeling/Result.dart';
import 'package:elevate_online_exam_app/features/questions/data/datasource/contract/exam_datasource.dart';
import 'package:elevate_online_exam_app/features/questions/domain/contract/repository/exam_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../auth/data/datasource/contracts/auth_datasource.dart';
import '../api/model/exam_response.dart';

@Injectable(as: ExamRepository)
class ExamRepositoryImpl implements ExamRepository {
  ExamOnlineDatasource examOnlineDatasource;
  AuthOfflineDataSource authOfflineDataSource;
  ExamRepositoryImpl(this.examOnlineDatasource, this.authOfflineDataSource);

  @override
  Future<Result<ExamResponse>> getQuestions() async {
    var user = await authOfflineDataSource.getUser();
    return await examOnlineDatasource.getQuestions(user!.token!);
  }
}
