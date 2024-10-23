import 'package:elevate_online_exam_app/features/questions/domain/model/answer_model.dart';
import 'package:elevate_online_exam_app/features/questions/presentation/viewmodels/exam_questions/exam_questions_action.dart';
import 'package:elevate_online_exam_app/features/questions/presentation/viewmodels/exam_questions/exam_questions_state.dart';
import 'package:elevate_online_exam_app/features/questions/usecases/exam_questions_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error_handeling/Result.dart';
import '../../../data/api/model/response/exam_response.dart';
import '../../../data/api/model/response/questions.dart';

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
        if (option != null) {
          _selectOption(option);
        } else {
          print("Selected option is null");
        }
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

      print('Fetched result: $result');

      if (result is Success<ExamResponse>) {
        _questions = result.data!.questions;

        // Debugging log to see the fetched questions
        print('Fetched questions: $_questions');

        if (_questions != null && _questions!.isNotEmpty) {
          _currentQuestionIndex = 0;
          emit(SuccessState(_questions!)); // Transition to success state
        } else {
          print('No questions found'); // Log that no questions were found
          emit(ErrorState(Exception('No questions found for this subject')));
        }
      } else if (result is Fail) {
        print('Failed to fetch questions'); // Log failure
        emit(ErrorState(
            Exception('Unknown error occurred'))); // Handle failure case
      }
    } catch (e) {
      print('Error occurred: $e'); // Log the exception
      emit(ErrorState(Exception('An error occurred: $e'))); // Handle exceptions
    }
  }

  void _addAnswer(String? questionId, String selectedAnswer) {
    final answer = AnswerModel(
      questionId: questionId,
      selectedAnswer: selectedAnswer,
    );
    selectedAnswers.add(answer);
  }

  void _removeAnswer() {
    selectedAnswers.removeLast();
  }

  void _nextQuestion() {
    if (_questions != null && _currentQuestionIndex < _questions!.length) {
      final currentQuestion = _questions![_currentQuestionIndex];

      // First, add the selected answer before resetting the option
      if (selectedOption != null) {
        final answer = AnswerModel(
          questionId: currentQuestion!.id!,
          selectedAnswer: selectedOption!,
        );
        selectedAnswers.add(answer);
      }
      print('Current Question ID: ${currentQuestion.id}'); // Log the ID

      // Move to the next question
      _currentQuestionIndex++;

      // Reset the selected option for the next question
      selectedOption = null;
      isAnswerCorrect = false;

      // Emit the new state
      emit(SuccessState(_questions!));
    }
  }

  void _previousQuestion() {
    if (_questions != null && _currentQuestionIndex > 0) {
      _currentQuestionIndex--;
      selectedOption = null;
      isAnswerCorrect = false;
      selectedAnswers.removeLast();

      emit(SuccessState(_questions!));
    }
  }

  void _selectOption(String option) {
    selectedOption = option;

    // Check if the selected option is correct
    if (currentQuestion != null &&
        currentQuestion!.correct != null &&
        currentQuestion!.correct == option) {
      isAnswerCorrect = true;
    } else {
      isAnswerCorrect = false;
    }

    // Add or update the selected answer
    final answerIndex = selectedAnswers
        .indexWhere((answer) => answer.questionId == currentQuestion?.id);
    if (answerIndex != -1) {
      // Update the existing answer
      selectedAnswers[answerIndex].selectedAnswer = option;
    } else {
      // Add a new answer
      if (currentQuestion?.id != null) {
        // Ensure question ID is not null
        _addAnswer(_questions?[currentQuestionIndex].id, option);
      }
    }

    // Emit the selected option and correctness state
    emit(SelectedOptionState(selectedOption));
  }

  void _submitExam() {
    emit(FinishState());
  }
}
