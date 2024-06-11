import 'package:flutter/material.dart';
import 'package:quiz_test_pro/screens/start/widgets/banner_item.dart';
import 'package:quiz_test_pro/screens/start/widgets/bottom_view.dart';

import '../../models/subject_model.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/size/app_size.dart';
import '../../utils/styles/app_text_styles.dart';
import '../widgets/global_custom_appbar.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key, required this.subjectModel});

  final SubjectModel subjectModel;

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Start Quiz',
            onTapOne: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: Container(
              width: width,
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.10),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 32.h,
                        right: 32.w,
                        left: 32.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Put your understanding of this concept to test by answering a few MCQs.',
                            style: AppTextStyles.poppinsRegular,
                          ),
                          15.getH(),
                          BannerItem(
                            subjectName: widget.subjectModel.subjectName,
                            subjectChapter: widget.subjectModel.chapter,
                            bannerTitle: widget.subjectModel.bannerTitle,
                            bannerColor: widget.subjectModel.bannerColor,
                            banner: widget.subjectModel.banner,
                          ),
                          25.getH(),
                          RichText(
                            text: TextSpan(
                                text: 'Total Questions:  ',
                                style: AppTextStyles.interRegular
                                    .copyWith(fontSize: 14),
                                children: [
                                  TextSpan(
                                      text:
                                          "${widget.subjectModel.questions.length}",
                                      style: AppTextStyles.interBold
                                          .copyWith(fontSize: 14))
                                ]),
                          ),
                          12.getH(),
                          RichText(
                            text: TextSpan(
                                text: 'Total Time:  ',
                                style: AppTextStyles.interRegular
                                    .copyWith(fontSize: 14),
                                children: [
                                  TextSpan(
                                      text:
                                          '${((widget.subjectModel.questions.length * 30) ~/ 60)} m ${((widget.subjectModel.questions.length * 30) % 60).toString().padLeft(2, '0')} sec',
                                      style: AppTextStyles.interBold
                                          .copyWith(fontSize: 14))
                                ]),
                          ),
                          12.getH(),
                          Text(
                            'Instructions:',
                            style: AppTextStyles.poppinsBold
                                .copyWith(fontSize: 14),
                          ),
                          4.getH(),
                          const Expanded(
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Text(
                                'The quizzes consists of questions carefully '
                                    'designed to help you self-assess your '
                                    'comprehension of the information presented '
                                    'on the topics covered in the module. \n\nAfter'
                                    ' responding to a question, click on the "Next'
                                    ' Question"\nbutton at the bottom to go to the'
                                    ' next question. After responding to the 8th '
                                    'question, click on "Close" on the top of '
                                    'the window to exit the quiz. \n\nIf you select'
                                    ' an incorrect response for a question, you can '
                                    'try again until you get the correct response. '
                                    'If you retake the quiz, the questions and their'
                                    ' respective responses will be randomized.',
                                style: AppTextStyles.poppinsRegular,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BottomView(subjectModel: widget.subjectModel)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
