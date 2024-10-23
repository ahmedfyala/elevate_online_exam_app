import 'package:elevate_online_exam_app/features/questions/presentation/viewmodels/check_answers/check_answer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckAnswerViewModel extends Cubit<CheckAnswerState> {
  CheckAnswerViewModel() : super(CheckAnswerInitial());
}
