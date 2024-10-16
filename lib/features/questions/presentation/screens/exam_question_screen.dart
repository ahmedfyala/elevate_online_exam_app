import 'package:elevate_online_exam_app/features/questions/presentation/viewmodels/exam_questions_state.dart';
import 'package:elevate_online_exam_app/features/questions/presentation/viewmodels/exam_questions_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';

class ExamQuestionsScreen extends StatelessWidget {
  final String subjectId =
      '670037f6728c92b7fdf434fc'; // The subjectId you want to query

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exam Questions')),
      body: BlocProvider<ExamQuestionsViewmodel>(
        create: (context) {
          final ExamQuestionsViewmodel examQuestionsViewmodel =
              getIt.get<ExamQuestionsViewmodel>();

          // Call fetchQuestions immediately after viewmodel creation
          examQuestionsViewmodel.fetchQuestionsBySubject(subjectId);

          return examQuestionsViewmodel;
        },
        child: BlocBuilder<ExamQuestionsViewmodel, ExamQuestionsState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is SuccessState) {
              if (state.questions != null && state.questions!.isNotEmpty) {
                return ListView.builder(
                  itemCount: state.questions!.length,
                  itemBuilder: (context, index) {
                    final question = state.questions![index];
                    return ListTile(
                      title: Text(question.question!),
                      subtitle: Text('Subject: ${question.subjectId}'),
                    );
                  },
                );
              } else {
                return Center(child: Text('No questions found'));
              }
            } else if (state is ErrorState) {
              return Center(
                  child: Text('Error: ${state.exception?.toString()}'));
            } else {
              return Center(child: Text('Please wait...'));
            }
          },
        ),
      ),
    );
  }
}
