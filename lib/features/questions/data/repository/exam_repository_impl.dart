import 'package:elevate_online_exam_app/core/error_handeling/Result.dart';
import 'package:elevate_online_exam_app/features/questions/data/datasource/contract/exam_datasource.dart';
import 'package:elevate_online_exam_app/features/questions/domain/contract/repository/exam_repository.dart';
import 'package:injectable/injectable.dart';

import '../api/model/exam_response.dart';

@Injectable(as: ExamRepository)
class ExamRepositoryImpl implements ExamRepository {
  ExamOnlineDatasource examOnlineDatasource;
  ExamRepositoryImpl(this.examOnlineDatasource);

  @override
  Future<Result<ExamResponse>> getQuestions(String token) async {
    return await examOnlineDatasource.getQuestions(token);
  }
}
