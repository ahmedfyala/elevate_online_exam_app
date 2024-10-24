class ExamModel {
  String? id;
  String? question;
  String? firstChoice;
  String? secondChoice;
  String? thirdChoice;
  String? fourthChoice;
  String? correctAnswer;
  String? subjectId;
  String? examId;
  String? examTitle;
  int? examDuration;
  int? examNumberOfQuestions;

  ExamModel({
    this.id,
    this.question,
    this.firstChoice,
    this.secondChoice,
    this.thirdChoice,
    this.fourthChoice,
    this.correctAnswer,
    this.subjectId,
    this.examId,
    this.examTitle,
    this.examDuration,
    this.examNumberOfQuestions,
  });
}
