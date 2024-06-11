import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/subject_model.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';
import '../../../utils/size/app_size.dart';
import '../../../utils/styles/app_text_styles.dart';
import '../../quiz/quiz_screen.dart';

class BottomView extends StatelessWidget {
  const BottomView({super.key, required this.subjectModel});

  final SubjectModel subjectModel;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      height: 54.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.10),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 32.w),
        child: Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppImages.timer),
                5.getW(),
                Text(
                  '${((subjectModel.questions.length * 30) ~/ 60).toString().padLeft(2, '0')} : ${((subjectModel.questions.length * 30) % 60).toString().padLeft(2, '0')}',
                  style: AppTextStyles.interMedium,
                )
              ],
            ),
            const Spacer(),
            Material(
              color: AppColors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return QuizScreen(
                      subjectModel: subjectModel,
                      timerMaxSeconds: subjectModel.questions.length * 30,
                    );
                  }));
                },
                borderRadius: BorderRadius.circular(40),
                child: Ink(
                  width: width / 1.7,
                  decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.40),
                      borderRadius: BorderRadius.circular(40),
                      ),
                  child: const Center(
                    child: Text('Start Quiz',
                        style: AppTextStyles.poppinsSemiBold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
