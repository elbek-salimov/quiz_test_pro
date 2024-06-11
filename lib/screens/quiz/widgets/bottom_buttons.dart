import 'package:flutter/material.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/size/app_size.dart';
import '../../../utils/styles/app_text_styles.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    super.key,
    required this.onPrevious,
    required this.onNext,
    required this.previousButtonVisibility,
    required this.nextButtonVisibility,
  });

  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final bool previousButtonVisibility;
  final bool nextButtonVisibility;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Material(
      color: AppColors.transparent,
      child: Row(
        children: [
          Visibility(
            visible: previousButtonVisibility,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: onPrevious,
              child: Ink(
                width: 112.w,
                height: 46.h,
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    'Previous',
                    style: AppTextStyles.poppinsSemiBold.copyWith(
                      color: AppColors.cBDBDBD,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Visibility(
            visible: nextButtonVisibility,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: onNext,
              child: Ink(
                width: 79.w,
                height: 46.h,
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.90),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    'Next',
                    style: AppTextStyles.poppinsSemiBold.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
