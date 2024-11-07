import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:elevate_online_exam_app/core/functions/show_awesome_dialoge.dart';
import 'package:elevate_online_exam_app/features/questions/presentation/viewmodels/exam_questions/exam_questions_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/di/di.dart';
import '../../../../core/routing/routes.dart';
import '../viewmodels/exam_questions/exam_questions_action.dart';
import '../viewmodels/exam_questions/exam_questions_viewmodel.dart';

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
                AppImages.clockImage,
                height: 30,
                width: 30,
              ),
              const SizedBox(width: 8),
              const Text(
                '30.00',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 16),
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
                  child:
                      BlocConsumer<ExamQuestionsViewmodel, ExamQuestionsState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SuccessState ||
                      state is SelectedOptionState) {
                    final question = examQuestionsViewmodel.currentQuestion;

                    if (question != null) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Question ${examQuestionsViewmodel.currentQuestionIndex + 1} of ${examQuestionsViewmodel.totalQuestions}',
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
                                  (examQuestionsViewmodel.currentQuestionIndex +
                                          1) /
                                      examQuestionsViewmodel.totalQuestions,
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
                          Text(question.question!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.black,
                              )),
                          const SizedBox(height: 16),
                          for (var choice in question.answers!)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      examQuestionsViewmodel.selectedOption ==
                                              choice.key
                                          ? Color(0xFFCCD7EB)
                                          : Color(0xFFEDEFF3),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: RadioListTile<String>(
                                  value: choice.key!,
                                  groupValue:
                                      examQuestionsViewmodel.selectedOption,
                                  onChanged: (value) {
                                    if (value != null) {
                                      setState(() {
                                        examQuestionsViewmodel.selectedOption =
                                            value;
                                      });
                                      examQuestionsViewmodel.doAction(
                                          SelectedOptionAction(value),
                                          option:
                                              value); // Emit selected option
                                    }
                                  },
                                  title: Text(
                                    choice.answer!,
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
                              examQuestionsViewmodel.hasPreviousQuestion
                                  ? Expanded(
                                      child: OutlinedButton(
                                        onPressed: () {
                                          examQuestionsViewmodel.doAction(
                                              PreviousQuestionAction());
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
                                    )
                                  : Expanded(
                                      child:
                                          Container()), // Empty container for spacing

                              Container(), // Empty container for spacing
                              const SizedBox(width: 16),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (examQuestionsViewmodel
                                        .hasNextQuestion) {
                                      examQuestionsViewmodel
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
                                          examQuestionsViewmodel
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
                  if (state is FinishState) {
                    // Pass the selected answers to the examScoreScreen
                    context.go(
                      Routes.examScoreScreen,
                      extra: {
                        'selectedAnswers':
                            examQuestionsViewmodel.selectedAnswers,
                        'subjectId': examQuestionsViewmodel.subjectId,
                      },
                    );
                  }
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
