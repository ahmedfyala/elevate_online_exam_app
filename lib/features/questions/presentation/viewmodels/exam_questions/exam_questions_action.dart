sealed class ExamQuestionsAction {}

class FetchQuestionsAction extends ExamQuestionsAction {}

class NextQuestionAction extends ExamQuestionsAction {}

class PreviousQuestionAction extends ExamQuestionsAction {}

class SelectOptionAction extends ExamQuestionsAction {
  final String option;
  SelectOptionAction(this.option);
}

class SubmitExamAction extends ExamQuestionsAction {}

class SelectedOptionAction extends ExamQuestionsAction {
  SelectedOptionAction(String s);
}
