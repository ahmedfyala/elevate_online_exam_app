import 'package:elevate_online_exam_app/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              context.go(Routes.examQuestionsScreen);
            },
            child: const Text('Start Exam')),
      ),
    );
  }
}
