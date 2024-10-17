import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:elevate_online_exam_app/core/functions/show_awesome_dialoge.dart';
import 'package:elevate_online_exam_app/features/questions/presentation/viewmodels/exam_questions_state.dart';
import 'package:elevate_online_exam_app/features/questions/presentation/viewmodels/exam_questions_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/di/di.dart';
import '../viewmodels/exam_questions_action.dart';

class ExamQuestionsScreen extends StatefulWidget {
  @override
  State<ExamQuestionsScreen> createState() => _ExamQuestionsScreenState();
}

class _ExamQuestionsScreenState extends State<ExamQuestionsScreen> {
  ExamQuestionsViewmodel examQuestionsViewmodel =
      getIt.get<ExamQuestionsViewmodel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              Image.asset(
                AppImages.clockImage, // Replace with your image asset path
                height: 30,
                width: 30, // Adjust size as needed
              ),
              const SizedBox(width: 8), // Space between image and text
              const Text(
                '30.00',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                  width: 16), // Some space at the end for better padding
            ],
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Exam',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
      ),
      body: BlocProvider<ExamQuestionsViewmodel>(
        create: (context) {
          examQuestionsViewmodel.doAction(FetchQuestionsAction());

          return examQuestionsViewmodel;
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Expanded(
                child: BlocConsumer<ExamQuestionsViewmodel, ExamQuestionsState>(
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is SuccessState) {
                      final viewmodel = context.read<ExamQuestionsViewmodel>();
                      final question = viewmodel.currentQuestion;

                      if (question != null) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                'Question ${viewmodel.currentQuestionIndex + 1} of ${viewmodel.totalQuestions}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color(0xFF535353),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              width: double.infinity,
                              height: 4,
                              decoration:
                                  BoxDecoration(color: const Color(0xFFCFCFCF)),
                              child: FractionallySizedBox(
                                widthFactor:
                                    (viewmodel.currentQuestionIndex + 1) /
                                        viewmodel.totalQuestions,
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 4,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF02369C),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(question.question,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.black,
                                )),
                            const SizedBox(height: 16),
                            for (var choice in [
                              question.A1,
                              question.A2,
                              question.A3,
                              question.A4
                            ].where((c) => c != null))
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: viewmodel.selectedOption == choice
                                        ? Color(0xFFCCD7EB)
                                        : Color(0xFFEDEFF3),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: RadioListTile<String>(
                                    value: choice!,
                                    groupValue: viewmodel.selectedOption,
                                    onChanged: (value) {
                                      setState(() {
                                        viewmodel.selectedOption = value;
                                      });
                                      viewmodel.doAction(SelectedOptionAction(
                                          value!)); // Emit selected option
                                    },
                                    title: Text(
                                      choice,
                                      style: const TextStyle(
                                        color: Color(0xFF1A1A1A),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    activeColor: const Color(0xFF0033CC),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                  ),
                                ),
                              ),
                            const SizedBox(height: 80),
                            Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {
                                      viewmodel
                                          .doAction(PreviousQuestionAction());
                                    },
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: Color(0xFF0033CC),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 32,
                                          vertical:
                                              12), // Padding for consistency
                                      side: BorderSide(
                                          color: Color(0xFF0033CC),
                                          width:
                                              2), // Border thickness and color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            12), // Rounded corners
                                      ),
                                    ),
                                    child: Text(
                                      'Back',
                                      style: TextStyle(
                                          color: Color(
                                              0xFF0033CC)), // Blue text color
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (viewmodel.hasNextQuestion) {
                                        viewmodel
                                            .doAction(NextQuestionAction());
                                      } else {
                                        // Show a confirmation dialog when the user reaches the last question
                                        showAwesomeDialog(
                                          context,
                                          title: 'Submit Exam',
                                          desc:
                                              'You have reached the last question. Do you want to submit the exam?',
                                          dialogType: DialogType.question,
                                          onOk: () {
                                            viewmodel
                                                .doAction(SubmitExamAction());
                                          },
                                          onCancel: () {},
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor:
                                          Color(0xFF0033CC), // White text
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 32,
                                          vertical:
                                              12), // Padding for a better look
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            12), // Rounded corners
                                      ),
                                    ),
                                    child: Text('Next'),
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      } else {
                        return const Center(
                            child: Text('No questions available'));
                      }
                    } else if (state is ErrorState) {
                      return Center(
                          child: Text('Error: ${state.exception?.toString()}'));
                    } else {
                      return const Center(child: Text('Please wait...'));
                    }
                  },
                  listener: (BuildContext context, ExamQuestionsState state) {
                    if (state is FinishState) {}
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
