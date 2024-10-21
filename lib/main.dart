import 'package:elevate_online_exam_app/core/di/di.dart';
import 'package:elevate_online_exam_app/core/routing/app_router.dart';
import 'package:elevate_online_exam_app/features/questions/domain/model/hive_questions.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(HiveQuestionsAdapter());

  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
    );
  }
}
