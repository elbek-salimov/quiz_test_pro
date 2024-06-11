import 'package:flutter/material.dart';

import '../../../models/subject_model.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/size/app_size.dart';
import '../../../utils/styles/app_text_styles.dart';

class SubjectsItem extends StatefulWidget {
  const SubjectsItem({
    super.key,
    required this.time,
    required this.onTap,
    required this.subjectModel,
  });

  final String time;
  final VoidCallback onTap;
  final SubjectModel subjectModel;

  @override
  State<SubjectsItem> createState() => _SubjectsItemState();
}

class _SubjectsItemState extends State<SubjectsItem> {
  String? selectedValue = 'easy';

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: widget.onTap,
          child: Ink(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              top: 10.h,
              bottom: 10.h,
            ),
            height: 100.h,
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.10),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(widget.subjectModel.subjectName,
                        style: AppTextStyles.poppinsBold),
                    const Spacer(),
                    Icon(Icons.access_time, color: AppColors.white, size: 18.w),
                    6.getW(),
                    Text(widget.time, style: AppTextStyles.poppinsMedium),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(widget.subjectModel.level.name,
                        style: AppTextStyles.poppinsSemiBold),
                    const Spacer(),
                    Text(widget.subjectModel.questions.length.toString(),
                        style: AppTextStyles.poppinsMedium,
                    ),
                    4.getW(),
                    Icon(Icons.checklist_outlined, color: AppColors.white, size: 18.w),
                  ],
                )
              ],
            ),
          ),
        ),
        30.getH()
      ],
    );
  }
}
