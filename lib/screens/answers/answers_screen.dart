import 'package:flutter/material.dart';
import '../../data/answer_report.dart';
import '../../utils/size/app_size.dart';
import '../../utils/styles/app_text_styles.dart';
import '../widgets/global_custom_appbar.dart';

class AnswersScreen extends StatelessWidget {
  const AnswersScreen({super.key, required this.answerReport});

  final AnswerReport answerReport;
  final String selectedAnswer = '';

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Answers',
            onTapOne: () {
              Navigator.pop(context);
            },
          ),
          10.getH(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ...List.generate(
                    answerReport.totalQuestionsCount,
                    (index) => Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 10.w),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text(
                          answerReport
                              .subjectModel.questions[index].questionText,
                          style: AppTextStyles.poppinsMedium,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'True answer: ${answerReport.subjectModel.questions[index].trueAnswer}',
                              style: AppTextStyles.poppinsRegular,
                            ),
                            Text(
                              'Your answer: ${
                                  answerReport.selectedAnswers[index] == 1 ?
                                  answerReport.subjectModel.questions[index].variantOne :
                                  answerReport.selectedAnswers[index] == 2 ?
                                  answerReport.subjectModel.questions[index].variantTwo :
                                  answerReport.selectedAnswers[index] == 3 ?
                                  answerReport.subjectModel.questions[index].variantThree :
                                  answerReport.selectedAnswers[index] == 4 ?
                                  answerReport.subjectModel.questions[index].variantFour :
                                      ''
                              }',
                              style: AppTextStyles.poppinsRegular,
                            ),
                          ],
                        ),
                        trailing: (answerReport.selectedAnswers[index] == 1 ?
                        answerReport.subjectModel.questions[index].variantOne :
                        answerReport.selectedAnswers[index] == 2 ?
                        answerReport.subjectModel.questions[index].variantTwo :
                        answerReport.selectedAnswers[index] == 3 ?
                        answerReport.subjectModel.questions[index].variantThree :
                        answerReport.selectedAnswers[index] == 4 ?
                        answerReport.subjectModel.questions[index].variantFour :
                        '') == answerReport.subjectModel.questions[index].trueAnswer
                            ? const Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                            : const Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
