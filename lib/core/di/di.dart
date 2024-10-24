import 'package:elevate_online_exam_app/features/questions/domain/model/hive_questions.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() async {
  getIt.init();

  getIt.registerSingletonAsync<Box<HiveQuestions>>(() async {
    return await Hive.openBox<HiveQuestions>('questions');
  });

  // Wait for all async registrations to complete
  await getIt.allReady();
}
