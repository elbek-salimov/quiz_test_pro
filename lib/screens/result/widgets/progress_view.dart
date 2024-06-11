import 'package:flutter/material.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/size/app_size.dart';
import '../../../utils/styles/app_text_styles.dart';

class ProgressView extends StatelessWidget {
  const ProgressView({
    super.key,
    required this.trueAnswersCount,
    required this.questionsCount,
    required this.percentage,
    required this.progressBarLength,
  });

  final double progressBarLength;
  final int trueAnswersCount;
  final int questionsCount;
  final int percentage;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.10),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.c_2F3739, width: 1.w),
          ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 100.h,
                width: 100.h,
                child: CircularProgressIndicator(
                  backgroundColor: AppColors.white.withOpacity(0.10),
                  color: AppColors.white.withOpacity(0.80),
                  value: progressBarLength,
                  strokeWidth: 6,
                  strokeCap: StrokeCap.round,
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: '$trueAnswersCount',
                    style: AppTextStyles.poppinsSemiBold.copyWith(
                      fontSize: 27,
                      height: 1,
                    ),
                    children: [
                      TextSpan(
                          text: '/$questionsCount\nyour score',
                          style: AppTextStyles.poppinsRegular.copyWith(
                            fontSize: 12,
                            color: AppColors.cF2F2F2.withOpacity(0.5),
                          ))
                    ]),
              )
            ],
          ),
          23.getW(),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: percentage >= 50
                    ? 'Congratulations! 😎 \nYou have passed\n'
                    : percentage > 0
                        ? 'Not bad! 😉 \nYou have passed\n'
                        : 'Sadly! 😔 \nYou have failed\n',
                style: AppTextStyles.interMedium.copyWith(height: 1.7),
                children: [
                  const TextSpan(
                    text: 'this test with ',
                  ),
                  TextSpan(
                    text: ' $percentage%. ',
                    style: AppTextStyles.interSemiBold.copyWith(
                      fontSize: 16,
                      color: AppColors.black,
                      backgroundColor: AppColors.white,
                      height: 1.1
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
