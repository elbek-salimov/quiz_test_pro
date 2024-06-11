import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_test_pro/screens/quiz/widgets/bottom_buttons.dart';
import 'package:quiz_test_pro/screens/quiz/widgets/timer_view.dart';
import 'package:quiz_test_pro/screens/quiz/widgets/variant_button.dart';


import '../../data/answer_report.dart';
import '../../models/quiz_model.dart';
import '../../models/subject_model.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/functions/functions.dart';
import '../../utils/size/app_size.dart';
import '../../utils/styles/app_text_styles.dart';
import '../result/result_screen.dart';
import '../widgets/global_custom_appbar.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen(
      {super.key, required this.subjectModel, required this.timerMaxSeconds});

  final SubjectModel subjectModel;
  final int timerMaxSeconds;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<QuizModel> questions = [];

  int activeIndex = 0;
  int selectedIndex = 0;
  int count = 0;
  Timer? _timer;

  Map<int, int> selectedAnswers = {};

  void startTimer() {
    _timer?.cancel();
    count = widget.timerMaxSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (count > 0) {
        setState(() {
          count--;
        });
      } else {
        _timer?.cancel();
        _navigateToResultScreen();
      }
    });
  }


  @override
  void initState() {
    questions = widget.subjectModel.questions;

    for (int i = 0; i < questions.length; i++) {
      selectedAnswers[i] = 0;
    }

    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Quiz',
            button: '1',
            onTapOne: () {
              Navigator.pop(context);
            },
            onTapTwo: () {
              _navigateToResultScreen();
            }
          ),
          TimerView(
            selectedAnswers: selectedAnswers,
            timerText: getMinutelyText(count),
            progress: count / (questions.length * 30),
            subjectModel: widget.subjectModel,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                left: 32.w,
                right: 32.w,
                top: 40.h,
                bottom: 20.h,
              ),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.c_161616,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        text: 'Q.${activeIndex + 1}',
                        style: AppTextStyles.poppinsSemiBold,
                        children: [
                          TextSpan(
                              text: '/${questions.length}',
                              style: AppTextStyles.poppinsRegular)
                        ]),
                  ),
                  12.getH(),
                  Text(
                    questions[activeIndex].questionText,
                    style: AppTextStyles.poppinsSemiBold.copyWith(
                      fontSize: 17,
                    ),
                  ),
                  24.getH(),
                  VariantButton(
                    variant: 'A.',
                    answer: questions[activeIndex].variantOne,
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                        selectedAnswers[activeIndex] = selectedIndex;
                      });
                    },
                    isSelected: selectedIndex == 1,
                  ),
                  VariantButton(
                    variant: 'B.',
                    answer: questions[activeIndex].variantTwo,
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                        selectedAnswers[activeIndex] = selectedIndex;
                      });
                    },
                    isSelected: selectedIndex == 2,
                  ),
                  VariantButton(
                    variant: 'C.',
                    answer: questions[activeIndex].variantThree,
                    onTap: () {
                      setState(() {
                        selectedIndex = 3;
                        selectedAnswers[activeIndex] = selectedIndex;
                      });
                    },
                    isSelected: selectedIndex == 3,
                  ),
                  VariantButton(
                    variant: 'D.',
                    answer: questions[activeIndex].variantFour,
                    onTap: () {
                      setState(() {
                        selectedIndex = 4;
                        selectedAnswers[activeIndex] = selectedIndex;
                      });
                    },
                    isSelected: selectedIndex == 4,
                  ),
                  const Spacer(),
                  BottomButtons(
                    previousButtonVisibility: activeIndex != 0,
                    nextButtonVisibility: activeIndex != questions.length - 1,
                    onPrevious: () {
                      if (activeIndex >= 1) {
                        activeIndex--;
                        selectedIndex = selectedAnswers[activeIndex]!;
                      }
                      setState(() {});
                    },
                    onNext: () {
                      selectedAnswers[activeIndex] = selectedIndex;
                      if (activeIndex < questions.length - 1) {
                        selectedIndex = 0;
                        activeIndex++;
                      }
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _navigateToResultScreen() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return ResultsScreen(
              answerReport: AnswerReport(
                selectedAnswers: selectedAnswers,
                subjectModel: widget.subjectModel,
                spentTime: questions.length * 30 - count,
              ),
            );
          },
        ),
      );
    });
  }
}