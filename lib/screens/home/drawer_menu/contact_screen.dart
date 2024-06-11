import 'package:flutter/material.dart';

import '../../../utils/size/app_size.dart';
import '../../../utils/styles/app_text_styles.dart';
import '../../widgets/global_custom_appbar.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: 'Contact', onTapOne: () {
            Navigator.pop(context);
          }),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contact Us',
                  style: AppTextStyles.interBold.copyWith(fontSize: 24),
                ),
                20.getH(),
                const Text(
                  'If you have any questions or suggestions, please feel free to contact us.',
                  style: AppTextStyles.interRegular,
                ),
                50.getH(),
                const Text(
                  'Email: elbeksalimov700@gmail.com',
                  style: AppTextStyles.interRegular,
                ),
                20.getH(),
                const Text(
                  'Phone: +99895 086 12 04',
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
