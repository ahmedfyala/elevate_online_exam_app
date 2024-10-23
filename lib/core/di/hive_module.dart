import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../features/questions/domain/model/hive_answers.dart';
import '../../features/questions/domain/model/hive_questions.dart';
import '../../features/questions/domain/model/hive_selected_answers.dart';
import 'di.dart';

@injectable
class HiveModule {
  Box<QuestionHive> get questionsBox => getIt<Box<QuestionHive>>();
  Box<ResultsHive> get answersBox => getIt<Box<ResultsHive>>();
  Box<SelectedAnswersHive> get selectedAnswersBox =>
      getIt<Box<SelectedAnswersHive>>();

  /// Method to store a value in the correct box based on type
  Future<void> put<T>(String key, T value) async {
    final box = _getBoxByType<T>();
    await box.put(key, value);
  }

  /// Method to retrieve a value from the correct box based on type
  T? get<T>(String key) {
    final box = _getBoxByType<T>();
    return box.get(key);
  }

  /// Method to delete a value from the correct box based on type
  Future<void> delete<T>(String key) async {
    final box = _getBoxByType<T>();
    await box.delete(key);
  }

  /// Private method to get the correct box based on the type
  Box<T> _getBoxByType<T>() {
    if (T == QuestionHive) {
      return questionsBox as Box<T>;
    } else if (T == ResultsHive) {
      return answersBox as Box<T>;
    } else if (T == SelectedAnswersHive) {
      return selectedAnswersBox as Box<T>;
    }
    throw Exception('No box defined for type $T');
  }
}
