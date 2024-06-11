import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';
import '../../../utils/size/app_size.dart';
import '../../../utils/styles/app_text_styles.dart';

class BottomButtonsView extends StatelessWidget {
  const BottomButtonsView({
    super.key,
    required this.onTapOne,
    required this.onTapTwo,
  });

  final VoidCallback onTapOne;
  final VoidCallback onTapTwo;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        InkWell(
          onTap: onTapOne,
          borderRadius: BorderRadius.circular(40),
          child: Ink(
            height: 48,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.30),
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: AppColors.white.withOpacity(0.40),
                  width: 2.w,
                ),
                ),
            child: const Center(
              child:
                  Text('Check Answers', style: AppTextStyles.poppinsSemiBold),
            ),
          ),
        ),
        16.getH(),
        InkWell(
          onTap: onTapTwo,
          borderRadius: BorderRadius.circular(40),
          child: Ink(
            height: 48,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.c_161616,
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: AppColors.white.withOpacity(0.40),
                  width: 2.w,
                ),
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppImages.tryAgain),
                10.getW(),
                const Text('Try Quiz Again',
                    style: AppTextStyles.poppinsSemiBold),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
