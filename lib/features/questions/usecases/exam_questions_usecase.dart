import 'package:elevate_online_exam_app/features/questions/domain/contract/repository/exam_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error_handeling/Result.dart';
import '../domain/model/exam_model.dart';

@injectable
class ExamQuestionsUseCase {
  final ExamRepository repository;

  ExamQuestionsUseCase(this.repository);

  Future<Result<List<ExamModel>>> getQuestions(String token) async {
    return await repository.getQuestions(token);
  }
}
