import 'package:elevate_online_exam_app/features/questions/domain/contract/repository/exam_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error_handeling/Result.dart';
import '../data/api/model/response/exam_response.dart';

@injectable
class ExamQuestionsUseCase {
  final ExamRepository repository;

  ExamQuestionsUseCase(this.repository);

  Future<Result<ExamResponse>> getQuestions() async {
    return await repository.getQuestions();
  }
}
