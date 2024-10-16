import 'package:elevate_online_exam_app/features/questions/data/api/model/questions.dart';
import 'package:elevate_online_exam_app/features/questions/presentation/viewmodels/exam_questions_action.dart';
import 'package:elevate_online_exam_app/features/questions/presentation/viewmodels/exam_questions_state.dart';
import 'package:elevate_online_exam_app/features/questions/usecases/exam_questions_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error_handeling/Result.dart';
import '../../data/api/model/exam_response.dart';

@injectable
class ExamQuestionsViewmodel extends Cubit<ExamQuestionsState> {
  final ExamQuestionsUseCase _examQuestionsUseCase;
  int _currentQuestionIndex = 0; // To keep track of the current question index
  List<Question>? _questions;
  String? selectedOption; // Track the selected option

  ExamQuestionsViewmodel(this._examQuestionsUseCase) : super(InitialState());
  final String subjectId = '670037f6728c92b7fdf434fc'; // Your subjectId
  bool get hasPreviousQuestion => _currentQuestionIndex > 0;
  bool get hasNextQuestion =>
      _questions != null && _currentQuestionIndex < _questions!.length - 1;
  int get currentQuestionIndex => _currentQuestionIndex;

  // Exposing the total number of questions
  int get totalQuestions => _questions?.length ?? 0;

  // You can also expose the current question text for convenience
  String get currentQuestionText => currentQuestion?.question ?? '';
  void doAction(ExamQuestionsAction action, {String? option}) {
    switch (action) {
      case FetchQuestionsAction():
        _fetchQuestionsBySubject();
        break;
      case NextQuestionAction():
        _nextQuestion();
        break;
      case PreviousQuestionAction():
        _previousQuestion();
        break;
      case SelectedOptionAction():
        _selectOption(option!);
        break;
      case SubmitExamAction():
        _submitExam();
        break;
      default:
        break;
    }
  }

  Question? get currentQuestion => _questions != null && _questions!.isNotEmpty
      ? _questions![_currentQuestionIndex]
      : null;
  Future<void> _fetchQuestionsBySubject() async {
    emit(LoadingState());
    try {
      // Fetch the questions
      var token =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3MDY4MmIwZTc3ZDY4NTk1YTI5MjE2NSIsInJvbGUiOiJ1c2VyIiwidXNlciI6eyJfaWQiOiI2NzA2ODJiMGU3N2Q2ODU5NWEyOTIxNjUiLCJ1c2VybmFtZSI6IkFobWVkczY2MjEwIiwiZmlyc3ROYW1lIjoiQWhtZWQiLCJsYXN0TmFtZSI6IlNhbGFoIiwiZW1haWwiOiJhaG1lZHM2NjIxMEBnbWFpbC5jb20iLCJwaG9uZSI6IjAxNTUzMTYxNjI0Iiwicm9sZSI6InVzZXIiLCJpc1ZlcmlmaWVkIjpmYWxzZSwiY3JlYXRlZEF0IjoiMjAyNC0xMC0wOVQxMzoxODo0MC45NzlaIn0sImlhdCI6MTcyOTAzNjYxNn0.pLku5veqk1_6moKYeaLSz9UeDxv4NBCbgoQB5qjYqyM';
      Result<ExamResponse> result =
          await _examQuestionsUseCase.getQuestions(token);

      if (result is Success<ExamResponse>) {
        _questions = result.data!.questions
            ?.where((element) => element.subject.id == subjectId)
            .toList();
        if (_questions != null && _questions!.isNotEmpty) {
          _currentQuestionIndex = 0;
          emit(SuccessState(_questions!)); // Transition to success state
        } else {
          emit(ErrorState(Exception(
              'No questions found for this subject'))); // Transition to error state
        }
      } else if (result is Fail) {
        emit(ErrorState(
            Exception('Unknown error occurred'))); // Handle failure case
      }
    } catch (e) {
      emit(ErrorState(Exception('An error occurred: $e'))); // Handle exceptions
    }
  }

  void _nextQuestion() {
    if (_questions != null) {
      // Check if it's the last question
      if (_currentQuestionIndex < _questions!.length - 1) {
        _currentQuestionIndex++;
        selectedOption = null;
        emit(SuccessState(_questions!));
      }
    }
  }

  _submitExam() {
    emit(FinishState());
  }

  void _previousQuestion() {
    if (_questions != null && _currentQuestionIndex > 0) {
      _currentQuestionIndex--;
      selectedOption = null;
      emit(SuccessState(_questions!));
    }
  }

  void _selectOption(String option) {
    selectedOption = option;
    emit(SelectedOptionState(selectedOption)); // Emit the selected option
  }
}
