import 'package:flutter/material.dart';

import '../../../utils/size/app_size.dart';
import '../../../utils/styles/app_text_styles.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({
    super.key,
    required this.subjectName,
    required this.subjectChapter,
    required this.banner,
    required this.bannerTitle,
    required this.bannerColor,
  });

  final String subjectName;
  final String subjectChapter;
  final String banner;
  final String bannerTitle;
  final Color bannerColor;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Container(
      height: 220.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: bannerColor, width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 18.w),
            height: 154.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: bannerColor,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: width / 3,
                  child: Text(
                    bannerTitle,
                    style: AppTextStyles.interBold,
                  ),
                ),
                SizedBox(
                  width: 162.w,
                  child: Image.asset(banner, fit: BoxFit.cover),
                )
              ],
            ),
          ),
          10.getH(),
          Row(
            children: [
              SizedBox(width: 16.w),
              RichText(
                text: TextSpan(
                    text: 'Subject: ',
                    style: AppTextStyles.interRegular.copyWith(fontSize: 14),
                    children: [
                      TextSpan(
                          text: subjectName,
                          style: AppTextStyles.interBold.copyWith(fontSize: 14))
                    ]),
              ),
            ],
          ),
          7.getH(),
          Row(
            children: [
              SizedBox(width: 16.w),
              RichText(
                text: TextSpan(
                    text: 'Chapter: ',
                    style: AppTextStyles.interRegular.copyWith(fontSize: 14),
                    children: [
                      TextSpan(
                          text: subjectChapter,
                          style: AppTextStyles.interBold.copyWith(fontSize: 14))
                    ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
