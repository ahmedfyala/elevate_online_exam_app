import 'package:elevate_online_exam_app/features/results/data/model/question_model.dart';
import 'package:elevate_online_exam_app/features/results/data/model/results_model.dart';
import 'package:elevate_online_exam_app/features/results/data/model/selected_answers_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/di/hive_module.dart';
import '../../../../questions/domain/model/hive_answers.dart';
import '../../../../questions/domain/model/hive_questions.dart';
import '../../../../questions/domain/model/hive_selected_answers.dart';
import '../contract/result_datasource.dart';

@Injectable(as: ResultOfflineDataSource)
class ResultOfflineDataSourceImpl implements ResultOfflineDataSource {
  final HiveModule _hiveModule;
  late final Box<QuestionHive> _hiveBox;
  late final Box<ResultsHive> _answersBox;
  late final Box<SelectedAnswersHive> _selectedAnswersBox;

  ResultOfflineDataSourceImpl(this._hiveModule) {
    _hiveBox = _hiveModule.questionsBox;
    _answersBox = _hiveModule.answersBox;
    _selectedAnswersBox = _hiveModule.selectedAnswersBox;
  }

  @override
  Future<List<QuestionModel>> getQuestions() async {
    final hiveQuestions = _hiveBox.values.toList();
    List<QuestionModel> questionModel = [];
    for (var hiveQuestion in hiveQuestions) {
      var question = hiveQuestion.toQuestionModel();
      questionModel.add(question);
    }
    return questionModel;
  }

  @override
  Future<List<ResultsModel>> getResults() async {
    final hiveAnswers = _answersBox.values.toList();
    List<ResultsModel> resultsModel = [];
    for (var hiveAnswer in hiveAnswers) {
      var result = hiveAnswer.toResultsModel();
      resultsModel.add(result);
    }
    return resultsModel;
  }

  @override
  Future<List<SelectedAnswersModel>> getSelectedAnswers() async {
    final hiveSelectedAnswers = _selectedAnswersBox.values.toList();
    List<SelectedAnswersModel> selectedAnswersModel = [];
    for (var hiveSelectedAnswer in hiveSelectedAnswers) {
      var selectedAnswer = hiveSelectedAnswer.toSelectedAnswersModel();
      selectedAnswersModel.add(selectedAnswer);
    }
    return selectedAnswersModel;
  }
}
