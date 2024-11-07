import 'package:elevate_online_exam_app/core/constants/app_color.dart';
import 'package:elevate_online_exam_app/core/routing/routes.dart';
import 'package:elevate_online_exam_app/core/widgets/custom_auth_button.dart';
import 'package:elevate_online_exam_app/features/questions/presentation/viewmodels/check_answers/check_answer_state.dart';
import 'package:elevate_online_exam_app/features/questions/presentation/viewmodels/check_answers/check_answer_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../domain/model/answer_model.dart';

class ExamScoreScreen extends StatelessWidget {
  final List<AnswerModel> selectedAnswers;

  ExamScoreScreen({
    required this.selectedAnswers,
    required this.subjectId,
    Key? key,
  }) : super(key: key);

  final CheckAnswerViewModel checkAnswerViewModel =
      GetIt.instance<CheckAnswerViewModel>();
  final String subjectId;
  @override
  Widget build(BuildContext context) {
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
      body: BlocProvider<CheckAnswerViewModel>(
        create: (context) {
          checkAnswerViewModel.checkAnswers(selectedAnswers, subjectId);
          return checkAnswerViewModel;
        },
        child: BlocConsumer<CheckAnswerViewModel, CheckAnswerState>(
          listener: (context, state) {
            // Handle states if needed
          },
          builder: (context, state) {
            if (state is CheckAnswerLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CheckAnswerSuccess) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Your Score',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: CircularProgressIndicator(
                              value: checkAnswerViewModel.total / 100,
                              strokeWidth: 10,
                              strokeCap: StrokeCap.round,
                              backgroundColor: Colors.red,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.blue),
                            ),
                          ),
                          Text(
                            '${checkAnswerViewModel.total}%',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Correct',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 8),
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.blue.withOpacity(0.1),
                              child: Text(
                                checkAnswerViewModel.correct.toString(),
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Column(
                          children: [
                            const Text(
                              'Incorrect',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 8),
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.red.withOpacity(0.1),
                              child: Text(
                                checkAnswerViewModel.wrong.toString(),
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    CustomAuthButton(
                        text: 'Show results',
                        onPressed: () {},
                        color: AppColor.primaryColor),
                    const SizedBox(height: 24),
                    CustomAuthButton(
                        textColor: AppColor.primaryColor,
                        text: 'Start again',
                        onPressed: () {
                          context.go(Routes.examQuestionsScreen);
                        },
                        color: AppColor.whiteColor),
                  ],
                ),
              );
            }
            return const Center(
              child: Text('Failed to check answers'),
            );
          },
        ),
      ),
    );
  }
}
