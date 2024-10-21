import 'package:elevate_online_exam_app/features/questions/data/api/model/questions.dart';
import 'package:elevate_online_exam_app/features/questions/domain/model/answer_model.dart';
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
  int _currentQuestionIndex = 0;
  List<Question>? _questions;
  String? selectedOption;
  bool isAnswerCorrect = false; // Track if the selected option is correct
  List<AnswerModel> selectedAnswers = [];
  ExamQuestionsViewmodel(this._examQuestionsUseCase) : super(InitialState());

  final String subjectId = '670037f6728c92b7fdf434fc';
  bool get hasPreviousQuestion => _currentQuestionIndex > 0;
  bool get hasNextQuestion =>
      _questions != null && _currentQuestionIndex < _questions!.length - 1;
  int get currentQuestionIndex => _currentQuestionIndex;

  // Expose total number of questions
  int get totalQuestions => _questions?.length ?? 0;

  // Expose current question text
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
      Result<ExamResponse> result = await _examQuestionsUseCase.getQuestions();

      if (result is Success<ExamResponse>) {
        _questions = result.data!.questions;
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

  void _addAnswer(String questionId, String selectedAnswer) {
    final answer = AnswerModel(
      questionId: questionId,
      selectedAnswer: selectedAnswer,
    );
    selectedAnswers.add(answer);
  }

  void _removeAnswer(String questionId) {
    selectedAnswers.removeWhere((element) => element.questionId == questionId);
  }

  void _nextQuestion() {
    if (_questions != null) {
      if (_currentQuestionIndex < _questions!.length - 1) {
        _currentQuestionIndex++;
        selectedOption = null;
        isAnswerCorrect = false;
        emit(SuccessState(_questions!));
      }
    }
  }

  void _previousQuestion() {
    if (_questions != null && _currentQuestionIndex > 0) {
      _currentQuestionIndex--;
      selectedOption = null;
      isAnswerCorrect = false;
      emit(SuccessState(_questions!));
    }
  }

  void _selectOption(String option) {
    selectedOption = option;

    // Check if the selected option is correct
    if (currentQuestion != null && currentQuestion!.correct == option) {
      isAnswerCorrect = true;
    } else {
      isAnswerCorrect = false;
    }

    // Emit the selected option and correctness state
    emit(SelectedOptionState(selectedOption));
  }

  void _submitExam() {
    emit(FinishState());
  }
}
