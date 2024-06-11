import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';
import '../../../utils/size/app_size.dart';
import '../../../utils/styles/app_text_styles.dart';

class ResultView extends StatelessWidget {
  const ResultView({
    super.key,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.totalTime,
    required this.avgTime,
  });

  final String correctAnswers;
  final String wrongAnswers;
  final String totalTime;
  final String avgTime;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        19.getH(),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 16.w, top: 6.h, bottom: 6.h),
                decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(16),
                    ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      correctAnswers,
                      style: AppTextStyles.poppinsSemiBold.copyWith(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Correct Answers',
                      style: AppTextStyles.poppinsMedium.copyWith(
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
              ),
            ),
            16.getW(),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 16.w, top: 6.h, bottom: 6.h),
                decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(16),
                    ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      wrongAnswers,
                      style: AppTextStyles.poppinsSemiBold.copyWith(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Wrong Answers',
                      style: AppTextStyles.poppinsMedium.copyWith(
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        19.getH(),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 16.w, top: 6.h, bottom: 6.h),
                decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.20),
                    borderRadius: BorderRadius.circular(16),
                    ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppImages.acceptTimer),
                    Text(
                      totalTime,
                      style: AppTextStyles.poppinsSemiBold,
                    ),
                    Text(
                      'Total Time',
                      style: AppTextStyles.poppinsMedium.copyWith(
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
              ),
            ),
            16.getW(),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 16.w, top: 6.h, bottom: 6.h),
                decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.20),
                    borderRadius: BorderRadius.circular(16),
                    ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppImages.wrongTimer),
                    Text(
                      avgTime,
                      style: AppTextStyles.poppinsSemiBold,
                    ),
                    Text(
                      'Avg. Time/Answer',
                      style: AppTextStyles.poppinsMedium.copyWith(
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        19.getH(),
      ],
    );
  }
}
