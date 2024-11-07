import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/di.dart';
import '../../../../core/routing/routes.dart';
import '../../data/model/question_model.dart';
import '../viewmodel/home_result/home_result_state.dart';
import '../viewmodel/home_result/home_result_viewmodel.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
      ),
      body: BlocProvider<HomeResultViewModel>(
        create: (context) => getIt<HomeResultViewModel>()..getResults(),
        child: BlocBuilder<HomeResultViewModel, HomeResultState>(
          builder: (context, state) {
            if (state is HomeResultLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeResultSuccess) {
              if (state.results.isEmpty) {
                return const Center(child: Text('No results available.'));
              }

              return ListView.builder(
                itemCount: state.results.length,
                itemBuilder: (context, index) {
                  final result = state.results[index];

                  // Find the question related to the result to get exam and subject names
                  final question = state.questions.firstWhere(
                    (q) {
                      print(
                          'No match found for result with subjectId: ${q.subjectId} ${result.subjectId}');
                      return q.subjectId == result.subjectId;
                    },
                    orElse: () => QuestionModel(
                      examName: 'Unknown Exam',
                      subjectName: 'Unknown Subject',
                    ),
                  );

                  final correctAnswers =
                      state.subjectCorrectAnswers[result.subjectId] ?? 0;
                  final totalQuestions =
                      state.subjectTotalQuestions[result.subjectId] ?? 0;

                  return InkWell(
                    onTap: () {
                      context.push(Routes.questionsResultScreen, extra: {
                        'questions': state.questions,
                        'answers': state.selectedAnswers,
                      });
                    },
                    child: Card(
                      margin: const EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              question.examName ?? 'Unknown Exam',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              question.subjectName ?? 'Unknown Subject',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[700],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Correct: $correctAnswers / ${result.correct! + result.wrong!}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${result.correct! + result.wrong!} Questions',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (state is HomeResultError) {
              return Center(child: Text('Error: ${state.exception}'));
            } else {
              return const Center(child: Text('No data'));
            }
          },
        ),
      ),
    );
  }
}
