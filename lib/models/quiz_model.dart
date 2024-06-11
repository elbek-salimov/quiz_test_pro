class QuizModel {
  final String questionText;
  final String variantOne;
  final String variantTwo;
  final String variantThree;
  final String variantFour;
  final String trueAnswer;

  QuizModel({
    required this.questionText,
    required this.variantOne,
    required this.variantTwo,
    required this.variantThree,
    required this.variantFour,
    required this.trueAnswer,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
        questionText: json['question_text'] as String? ?? '',
        variantOne: json['variant_one'] as String? ?? '',
        variantTwo: json['variant_two'] as String? ?? '',
        variantThree: json['variant_three'] as String? ?? '',
        variantFour: json['variant_four'] as String? ?? '',
        trueAnswer: json['true_answer'] as String? ?? '');
  }
}
