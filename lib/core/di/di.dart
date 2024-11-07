import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../features/questions/domain/model/hive_answers.dart';
import '../../features/questions/domain/model/hive_questions.dart';
import '../../features/questions/domain/model/hive_selected_answers.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() async {
  getIt.init();

  getIt.registerSingletonAsync<Box<QuestionHive>>(() async {
    return await Hive.openBox<QuestionHive>('questions_v4');
  });

  getIt.registerSingletonAsync<Box<ResultsHive>>(() async {
    return await Hive.openBox<ResultsHive>('answers_v4');
  });

  getIt.registerSingletonAsync<Box<SelectedAnswersHive>>(() async {
    return await Hive.openBox<SelectedAnswersHive>('selected_v4');
  });

  // Wait for all async registrations to complete
  await getIt.allReady();
}
