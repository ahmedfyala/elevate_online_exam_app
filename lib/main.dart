import 'package:elevate_online_exam_app/core/di/di.dart';
import 'package:elevate_online_exam_app/core/routing/app_router.dart';
import 'package:elevate_online_exam_app/features/questions/domain/model/hive_questions.dart';
import 'package:elevate_online_exam_app/features/questions/domain/model/hive_selected_answers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/questions/domain/model/hive_answers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register Hive adapters for custom data models
  Hive.registerAdapter(QuestionHiveAdapter());
  Hive.registerAdapter(ResultsHiveAdapter());
  Hive.registerAdapter(SelectedAnswersHiveAdapter());
  await configureDependencies();

  final appRouter = getIt.get<AppRouter>(); // Create an instance of AppRouter

  runApp(MyApp(appRouter: appRouter));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter; // Add this line to accept the router instance

  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:
          Size(375, 812), // Adjust this to match your design's screen size
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Elevate Online Exam App',
          routerConfig: appRouter.router, // Use the instance's router here
        );
      },
    );
  }
}
