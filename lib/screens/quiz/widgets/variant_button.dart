import 'package:flutter/material.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/size/app_size.dart';
import '../../../utils/styles/app_text_styles.dart';

class VariantButton extends StatefulWidget {
  const VariantButton({
    super.key,
    required this.variant,
    required this.answer,
    required this.onTap,
    required this.isSelected,
  });

  final String variant;
  final String answer;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  State<VariantButton> createState() => _VariantButtonState();
}

class _VariantButtonState extends State<VariantButton> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Material(
        color: AppColors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: widget.onTap,
          child: Ink(
            padding: EdgeInsets.only(left: 20.w),
            height: 48.h,
            decoration: BoxDecoration(
              color: widget.isSelected == true
                  ? AppColors.white.withOpacity(0.40)
                  : AppColors.white.withOpacity(0.10),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Text(
                  widget.variant,
                  style: AppTextStyles.poppinsBold.copyWith(
                    fontSize: 14,
                  ),
                ),
                12.getW(),
                Text(
                  widget.answer,
                  style: AppTextStyles.poppinsMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
