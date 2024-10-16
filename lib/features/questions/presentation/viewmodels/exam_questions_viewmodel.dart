import 'package:elevate_online_exam_app/features/questions/presentation/viewmodels/exam_questions_state.dart';
import 'package:elevate_online_exam_app/features/questions/usecases/exam_questions_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error_handeling/Result.dart';
import '../../domain/model/exam_model.dart';

@injectable
class ExamQuestionsViewmodel extends Cubit<ExamQuestionsState> {
  final ExamQuestionsUseCase _examQuestionsUseCase;

  ExamQuestionsViewmodel(this._examQuestionsUseCase) : super(InitialState());

  Future<void> fetchQuestionsBySubject(String subjectId) async {
    try {
      emit(LoadingState());

      var token =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3MDY4MmIwZTc3ZDY4NTk1YTI5MjE2NSIsInJvbGUiOiJ1c2VyIiwidXNlciI6eyJfaWQiOiI2NzA2ODJiMGU3N2Q2ODU5NWEyOTIxNjUiLCJ1c2VybmFtZSI6IkFobWVkczY2MjEwIiwiZmlyc3ROYW1lIjoiQWhtZWQiLCJsYXN0TmFtZSI6IlNhbGFoIiwiZW1haWwiOiJhaG1lZHM2NjIxMEBnbWFpbC5jb20iLCJwaG9uZSI6IjAxNTUzMTYxNjI0Iiwicm9sZSI6InVzZXIiLCJpc1ZlcmlmaWVkIjpmYWxzZSwiY3JlYXRlZEF0IjoiMjAyNC0xMC0wOVQxMzoxODo0MC45NzlaIn0sImlhdCI6MTcyOTAzNjYxNn0.pLku5veqk1_6moKYeaLSz9UeDxv4NBCbgoQB5qjYqyM';

      if (token.isEmpty) {
        emit(ErrorState(Exception('Authentication token not found')));
        return;
      }

      // Call the use case and pass the token
      Result<List<ExamModel>> result =
          await _examQuestionsUseCase.getQuestions(token);

      if (result is Success<List<ExamModel>> && result.data != null) {
        List<ExamModel> filteredQuestions = result.data!
            .where((question) => question.subjectId == subjectId)
            .toList();

        emit(SuccessState(filteredQuestions));
      } else if (result is Fail) {
        // Emit actual exception from the Fail object
        emit(ErrorState(Exception('Unknown error occurred')));
      }
    } catch (e, stackTrace) {
      // Catch more specific exceptions if needed, log stack trace for debugging
      emit(
          ErrorState(e is Exception ? e : Exception('Unknown error occurred')));
      print(stackTrace); // For debugging
    }
  }
}
