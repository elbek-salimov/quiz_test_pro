import 'package:flutter/material.dart';
import 'package:quiz_test_pro/screens/result/widgets/bottom_buttons_view.dart';
import 'package:quiz_test_pro/screens/result/widgets/progress_view.dart';
import 'package:quiz_test_pro/screens/result/widgets/result_view.dart';

import '../../data/answer_report.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/functions/functions.dart';
import '../../utils/size/app_size.dart';
import '../../utils/styles/app_text_styles.dart';
import '../answers/answers_screen.dart';
import '../start/start_screen.dart';
import '../widgets/global_custom_appbar.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({
    super.key,
    required this.answerReport,
  });

  final AnswerReport answerReport;

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  int trueAnswersCount = 0;
  int? selectedCount;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
              title: 'Quiz Result',
              onTapOne: () {
                Navigator.pop(context);
              }),
          Padding(
            padding: EdgeInsets.only(left: 32.w, right: 32.w),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 16.h,
                    bottom: 16.h,
                    left: 20.w,
                    right: 20.w,
                  ),
                  height: 101.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.c_2F3739, width: 1.w),
                     ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.answerReport.subjectModel.bannerTitle,
                        style: AppTextStyles.interRegular,
                      ),
                      20.getH(),
                      Text(
                        '${widget.answerReport.subjectModel.subjectName} / ${widget.answerReport.subjectModel.chapter}',
                        style: AppTextStyles.interRegular.copyWith(
                          fontSize: 13,
                          color: AppColors.cF2F2F2.withOpacity(0.5),
                        ),
                      )
                    ],
                  ),
                ),
                19.getH(),
                ProgressView(
                  trueAnswersCount: widget.answerReport.trueAnswersCount,
                  questionsCount: widget.answerReport.totalQuestionsCount,
                  percentage: ((widget.answerReport.trueAnswersCount /
                              widget.answerReport.totalQuestionsCount) *
                          100)
                      .toInt(),
                  progressBarLength: widget.answerReport.trueAnswersCount /
                      widget.answerReport.totalQuestionsCount,
                ),
                ResultView(
                  correctAnswers:
                      widget.answerReport.trueAnswersCount.toString(),
                  wrongAnswers:
                      widget.answerReport.falseAnswersCount.toString(),
                  totalTime: getMinutelyText(widget.answerReport.spentTime),
                  avgTime: getMinutelyText(
                      widget.answerReport.averageTimeForEachAnswer),
                ),
                BottomButtonsView(
                  onTapOne: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AnswersScreen(answerReport: widget.answerReport);
                    }));
                  },
                  onTapTwo: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return StartScreen(
                          subjectModel: widget.answerReport.subjectModel);
                    }));
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
