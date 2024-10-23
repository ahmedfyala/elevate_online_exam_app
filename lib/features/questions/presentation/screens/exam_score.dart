import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes.dart';
import '../../domain/model/answer_model.dart';

class ExamScoreScreen extends StatelessWidget {
  final List<AnswerModel> selectedAnswers;

  const ExamScoreScreen({required this.selectedAnswers, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Process the selected answers, display them, or calculate the score
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go(Routes.examQuestionsScreen);
          },
        ),
        title: const Text('Exam Score'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Your Answers:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            for (var answer in selectedAnswers)
              Text(
                  'Question ID: ${answer.questionId}, Selected Answer: ${answer.selectedAnswer}'),
            // You can also add scoring logic here
          ],
        ),
      ),
    );
  }
}
