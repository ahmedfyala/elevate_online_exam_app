import 'package:elevate_online_exam_app/features/results/data/datasource/contract/result_datasource.dart';
import 'package:elevate_online_exam_app/features/results/data/model/question_model.dart';
import 'package:elevate_online_exam_app/features/results/data/model/results_model.dart';
import 'package:elevate_online_exam_app/features/results/data/model/selected_answers_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/contract/result_repository.dart';

@Injectable(as: ResultRepository)
class ResultRepositoryImpl implements ResultRepository {
  final ResultOfflineDataSource _resultOfflineDataSource;

  ResultRepositoryImpl(this._resultOfflineDataSource);

  @override
  Future<List<QuestionModel>> getQuestions() async {
    return await _resultOfflineDataSource.getQuestions();
  }

  @override
  Future<List<ResultsModel>> getResults() async {
    return await _resultOfflineDataSource.getResults();
  }

  @override
  Future<List<SelectedAnswersModel>> getSelectedAnswers() async {
    return await _resultOfflineDataSource.getSelectedAnswers();
  }
}
