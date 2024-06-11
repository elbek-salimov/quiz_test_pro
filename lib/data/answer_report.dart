import '../models/quiz_model.dart';
import '../models/subject_model.dart';

class AnswerReport {
  final Map<int, int> selectedAnswers;

  final SubjectModel subjectModel;

  final int spentTime;
  int trueAnswersCount = 0;
  int falseAnswersCount = 0;
  int averageTimeForEachAnswer = 0;
  int totalTime = 0;
  double truePercentage = 0.0;
  int totalQuestionsCount = 0;

  AnswerReport({
    required this.subjectModel,
    required this.selectedAnswers,
    required this.spentTime,
  }) {
    _checkAnswers();
  }

  _checkAnswers() {
    for (int i = 0; i < subjectModel.questions.length; i++) {
      QuizModel quiz = subjectModel.questions[i];
      int selection = selectedAnswers[i] ?? 0;
      if (selection > 0) {
        if ((selection == 1 && quiz.trueAnswer == quiz.variantOne) ||
            (selection == 2 && quiz.trueAnswer == quiz.variantTwo) ||
            (selection == 3 && quiz.trueAnswer == quiz.variantThree) ||
            (selection == 4 && quiz.trueAnswer == quiz.variantFour)) {
          trueAnswersCount++;
        }
      }

      falseAnswersCount = subjectModel.questions.length - trueAnswersCount;

      int onlySelectedAnswersCount =
          selectedAnswers.values.where((answer) => answer != 0).length;

      if (onlySelectedAnswersCount > 0) {
        averageTimeForEachAnswer = spentTime ~/ onlySelectedAnswersCount;
      } else {
        averageTimeForEachAnswer = 0;
      }
    }

    totalTime = subjectModel.questions.length * 10;

    truePercentage = subjectModel.questions.isNotEmpty
        ? (trueAnswersCount / subjectModel.questions.length)
        : 0.0;

    totalQuestionsCount = subjectModel.questions.length;
  }
}