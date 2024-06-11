import 'package:flutter/material.dart';

import '../../../utils/size/app_size.dart';
import '../../../utils/styles/app_text_styles.dart';
import '../../widgets/global_custom_appbar.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: 'Theme', onTapOne: () {
            Navigator.pop(context);
          }),
          const Expanded(
            child: Center(
              child: Text(
                'Theme not configured!',
                style: AppTextStyles.interBold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
