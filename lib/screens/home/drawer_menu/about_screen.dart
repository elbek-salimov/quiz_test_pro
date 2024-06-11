import 'package:flutter/material.dart';

import '../../../utils/size/app_size.dart';
import '../../../utils/styles/app_text_styles.dart';
import '../../widgets/global_custom_appbar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: 'About', onTapOne: () {
            Navigator.pop(context);
          }),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Column(
              children: [
                Text(
                  'Quiz Test',
                  style: AppTextStyles.interBold.copyWith(fontSize: 24),
                ),
                20.getH(),
                const Text(
                  'Quiz App is a simple quiz application that allows users to test their knowledge on various topics.',
                  style: AppTextStyles.interRegular,
                ),
                50.getH(),
                const Text(
                  'Version: 1.0',
                  style: AppTextStyles.interRegular,
                ),
                20.getH(),
                const Text(
                  'Developed by: Elbek Salimov',
                  style: AppTextStyles.interRegular,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
