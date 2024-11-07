import 'package:elevate_online_exam_app/features/results/data/model/selected_answers_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/question_model.dart';
import '../../../usecase/result_usecase.dart';
import 'home_result_state.dart';

@injectable
class HomeResultViewModel extends Cubit<HomeResultState> {
  final ResultUseCase _resultUseCase;

  HomeResultViewModel(this._resultUseCase) : super(HomeResultInitial());
  late List<QuestionModel> questions;
  late List<SelectedAnswersModel> answers;

  getResults() async {
    emit(HomeResultLoading());
    try {
      // Fetch data from the use case
      final results = await _resultUseCase.getResults();
      questions = await _resultUseCase.getQuestions();
      answers = await _resultUseCase.getSelectedAnswers();
      print('total results: ${results[0].wrong! + results[0].correct!}');
      // Initialize the maps to store correct answers and question counts per subject
      final subjectCorrectAnswers = <String, int>{};
      final subjectTotalQuestions = <String, int>{};

      for (var result in results) {
        // Find the corresponding question to get the exam and subject names
        final question = questions.firstWhere(
          (q) => q.subjectId == result.subjectId,
          orElse: () {
            print('No question found for subjectId: ${result.subjectId}');
            return QuestionModel(
              examName: 'Unknown Exam',
              subjectName: 'Unknown Subject',
            );
          },
        );

        // Initialize and update counts
        subjectCorrectAnswers[result.subjectId ?? ''] =
            (subjectCorrectAnswers[result.subjectId ?? ''] ?? 0) +
                (result.correct?.toInt() ?? 0);

        subjectTotalQuestions[result.subjectId ?? ''] =
            (subjectTotalQuestions[result.subjectId ?? ''] ?? 0) + 1;
      }

      // Pass results to the UI with subject breakdown
      emit(HomeResultSuccess(
        results: results,
        questions: questions,
        selectedAnswers: answers,
        subjectCorrectAnswers: subjectCorrectAnswers,
        subjectTotalQuestions: subjectTotalQuestions,
      ));
    } catch (e) {
      emit(HomeResultError(Exception(e.toString())));
    }
  }
}
