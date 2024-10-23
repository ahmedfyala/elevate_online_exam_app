import 'package:injectable/injectable.dart';

import '../data/model/question_model.dart';
import '../data/model/results_model.dart';
import '../data/model/selected_answers_model.dart';
import '../domain/contract/result_repository.dart';

@injectable
class ResultUseCase {
  final ResultRepository _resultRepository;

  ResultUseCase(this._resultRepository);

  Future<List<QuestionModel>> getQuestions() async {
    return await _resultRepository.getQuestions();
  }

  Future<List<ResultsModel>> getResults() async {
    return await _resultRepository.getResults();
  }

  Future<List<SelectedAnswersModel>> getSelectedAnswers() async {
    return await _resultRepository.getSelectedAnswers();
  }
}
