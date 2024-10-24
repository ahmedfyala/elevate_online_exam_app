import 'package:elevate_online_exam_app/core/di/di.dart';
import 'package:elevate_online_exam_app/core/routing/app_router.dart';
import 'package:elevate_online_exam_app/features/questions/domain/model/hive_questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register the Hive adapter for custom data model
  Hive.registerAdapter(HiveQuestionsAdapter());

  // Ensure Hive box is open for the 'questions' box
  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
