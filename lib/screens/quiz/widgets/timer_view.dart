import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/subject_model.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';
import '../../../utils/size/app_size.dart';
import '../../../utils/styles/app_text_styles.dart';

class TimerView extends StatefulWidget {
  const TimerView({
    super.key,
    required this.subjectModel,
    required this.selectedAnswers,
    required this.timerText,
    required this.progress,
  });

  final SubjectModel subjectModel;
  final String timerText;
  final double progress;
  final Map<int, int> selectedAnswers;

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
        top: 10.h,
        left: 32.w,
        right: 32.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.subjectModel.bannerTitle,
            style: AppTextStyles.interRegular.copyWith(fontSize: 20),
          ),
          7.getH(),
          Row(
            children: [
              Text(
                  '${widget.subjectModel.subjectName} / ${widget.subjectModel.chapter}',
                  style: AppTextStyles.interRegular
                      .copyWith(color: AppColors.cF2F2F2.withOpacity(0.5))),
              const Spacer(),
              SvgPicture.asset(
                AppImages.timer,
                colorFilter: ColorFilter.mode(
                    widget.timerText == '00 : 00'
                        ? AppColors.white.withOpacity(0.20)
                        : AppColors.white,
                    BlendMode.srcIn),
              ),
              5.getW(),
              Text(
                widget.timerText,
                style: AppTextStyles.interMedium.copyWith(
                    color: widget.timerText == '00 : 00'
                        ? AppColors.white.withOpacity(0.20)
                        : AppColors.white),
              )
            ],
          ),
          10.getH(),
          LinearProgressIndicator(
            value: widget.progress,
            minHeight: 8,
            borderRadius: BorderRadius.circular(16),
            backgroundColor: AppColors.white.withOpacity(0.10),
            color: AppColors.white,
          ),
          25.getH(),
        ],
      ),
    );
  }
}
