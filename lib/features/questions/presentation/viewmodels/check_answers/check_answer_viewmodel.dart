import 'package:elevate_online_exam_app/core/error_handeling/Result.dart';
import 'package:elevate_online_exam_app/features/questions/data/api/model/response/check_answer_response.dart';
import 'package:elevate_online_exam_app/features/questions/presentation/viewmodels/check_answers/check_answer_state.dart';
import 'package:elevate_online_exam_app/features/questions/usecases/check_questions_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/model/answer_model.dart';

@injectable
class CheckAnswerViewModel extends Cubit<CheckAnswerState> {
  final CheckAnswersUseCase _checkAnswersUseCase;
  CheckAnswerViewModel(this._checkAnswersUseCase) : super(CheckAnswerInitial());

  int total = 0; // Store total as an integer after rounding
  num correct = 0;
  num wrong = 0;

  checkAnswers(List<AnswerModel> answers, String subjectId) async {
    emit(CheckAnswerLoading());
    try {
      final result = await _checkAnswersUseCase.checkAnswer(answers);
      print('the answers are $answers');
      switch (result) {
        case Success<CheckAnswerResponse>():
          print(result.data);
          // Remove the '%' symbol, parse to double, round, and convert to integer
          total = double.parse(result.data!.total!.replaceAll('%', '')).round();
          correct = result.data!.correct!;
          wrong = result.data!.wrong!;
          print('checkAnswerViewModel: $total, $correct, $wrong');
          _checkAnswersUseCase.saveAnswersResult(result.data!, subjectId);
          _checkAnswersUseCase.saveSelectedAnswers(answers);
          emit(CheckAnswerSuccess(result.data));
          break;

        case Fail<CheckAnswerResponse>():
          emit(CheckAnswerError(Exception('Failed to check answers')));
          break;

        case Loading<CheckAnswerResponse>():
          // TODO: Handle this case.
          break;
      }
    } catch (e) {
      emit(CheckAnswerError(Exception(e.toString())));
    }
  }
}
