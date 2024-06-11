import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';
import '../../utils/styles/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.button,
    required this.onTapOne,
    this.onTapTwo,
  });

  final String title;
  final String? button;
  final VoidCallback onTapOne;
  final VoidCallback? onTapTwo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22, top: 50, left: 32, right: 32),
      child: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onTapOne,
            child: Ink(
              padding: const EdgeInsets.all(12),
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                  color: AppColors.c_161616,
                  borderRadius: BorderRadius.circular(12),
                 ),
              child: SvgPicture.asset(AppImages.back),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: AppTextStyles.interMedium.copyWith(
              fontSize: 20,
            ),
          ),
          const Spacer(),
          button != null
              ? InkWell(
                  onTap: onTapTwo,
                  borderRadius: BorderRadius.circular(16),
                  child: Ink(
                    width: 84,
                    height: 48,
                    decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.10),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.white, width: 1),
                        ),
                    child: const Center(
                        child:
                            Text('Submit', style: AppTextStyles.interMedium)),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
