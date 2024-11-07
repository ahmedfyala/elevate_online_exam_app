import 'package:elevate_online_exam_app/features/results/data/model/question_model.dart';
import 'package:flutter/material.dart';

import '../../data/model/selected_answers_model.dart';

class QuestionResultScreen extends StatelessWidget {
  const QuestionResultScreen({
    Key? key,
    required this.questions,
    required this.answers,
  }) : super(key: key);

  final List<QuestionModel> questions;
  final List<SelectedAnswersModel> answers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question Results'),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];
          final userAnswer = answers.firstWhere(
            (answer) => answer.questionId == question.questionId,
            orElse: () => SelectedAnswersModel(),
          );

          return QuestionResultTile(
            key: ValueKey(question.questionId),
            question: question,
            userAnswer: userAnswer,
          );
        },
      ),
    );
  }
}

class QuestionResultTile extends StatelessWidget {
  const QuestionResultTile({
    Key? key,
    required this.question,
    required this.userAnswer,
  }) : super(key: key);

  final QuestionModel question;
  final SelectedAnswersModel userAnswer;

  bool isCorrectAnswer(String optionKey) {
    return optionKey == question.correct;
  }

  bool isSelectedAnswer(String optionKey) {
    return optionKey == userAnswer.selectedAnswer;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.question ?? '',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ..._buildOptionsList(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildOptionsList() {
    // Map of option keys to their display texts
    final optionsMap = {
      question.firstOptionKey ?? '': question.firstOption ?? '',
      question.secondOptionKey ?? '': question.secondOption ?? '',
      question.thirdOptionKey ?? '': question.thirdOption ?? '',
      question.fourthOptionKey ?? '': question.fourthOption ?? '',
    };

    // Filter out any options where the text is null or empty
    final filteredOptionsMap =
        optionsMap.entries.where((entry) => entry.value.isNotEmpty).toList();

    return filteredOptionsMap.map((entry) {
      final optionKey = entry.key;
      final optionText = entry.value;
      final isCorrect = isCorrectAnswer(optionKey);
      final isSelected = isSelectedAnswer(optionKey);

      return Container(
        key: ValueKey(optionKey), // Assign a unique key to each option
        decoration: BoxDecoration(
          color: isCorrect
              ? Colors.green.withOpacity(0.2)
              : (isSelected ? Colors.red.withOpacity(0.2) : Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          leading: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isCorrect
                  ? Colors.green
                  : (isSelected ? Colors.red : Colors.white),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: Colors.grey.shade400,
                width: 1.5,
              ),
            ),
            child: isSelected
                ? const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16,
                  )
                : null,
          ),
          title: Text(
            optionText, // Display the option text here
            style: TextStyle(
              color: isCorrect
                  ? Colors.green
                  : (isSelected ? Colors.red : Colors.black),
              fontWeight:
                  isSelected || isCorrect ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      );
    }).toList();
  }
}
