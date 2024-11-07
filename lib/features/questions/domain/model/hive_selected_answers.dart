import 'package:elevate_online_exam_app/features/results/data/model/selected_answers_model.dart';
import 'package:hive/hive.dart';

part 'hive_selected_answers.g.dart';

@HiveType(typeId: 9)
class SelectedAnswersHive {
  @HiveField(0)
  final String? questionId;
  @HiveField(1)
  final String? selectedAnswer;

  SelectedAnswersHive({this.questionId, this.selectedAnswer});

  SelectedAnswersModel toSelectedAnswersModel() {
    return SelectedAnswersModel(
      questionId: questionId,
      selectedAnswer: selectedAnswer,
    );
  }
}
