import 'package:flutter/material.dart';
import 'package:quiz_test_pro/screens/home/widgets/profile_photo.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';
import '../../../utils/size/app_size.dart';
import '../../../utils/styles/app_text_styles.dart';
import '../drawer_menu/about_screen.dart';
import '../drawer_menu/contact_screen.dart';
import '../drawer_menu/language_screen.dart';
import '../drawer_menu/theme_screen.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key, required this.userName});

  final String userName;

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Drawer(
      backgroundColor: AppColors.c_161616,
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: const AssetImage(AppImages.quizBanner),
                colorFilter: ColorFilter.mode(
                  AppColors.white.withOpacity(0.3),
                  BlendMode.modulate,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProfilePhoto(),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      widget.userName,
                      style: AppTextStyles.poppinsBold.copyWith(
                        shadows: [const Shadow(blurRadius: 60)],
                      ),
                    ),
                    5.getW(),
                    const Icon(
                      Icons.verified_sharp,
                      color: AppColors.white,
                      size: 16,
                    )
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.language, color: AppColors.white),
            title: const Text('Language', style: AppTextStyles.poppinsRegular),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const LanguageScreen();
              }))
            },
          ),
          ListTile(
            leading: const Icon(Icons.light_mode, color: AppColors.white),
            title: const Text('Theme', style: AppTextStyles.poppinsRegular),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ThemeScreen();
              }))
            },
          ),
          ListTile(
            leading: const Icon(Icons.info, color: AppColors.white),
            title: const Text('About', style: AppTextStyles.poppinsRegular),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const AboutScreen();
              }))
            },
          ),
          ListTile(
            leading: const Icon(Icons.help, color: AppColors.white),
            title: const Text('Contact', style: AppTextStyles.poppinsRegular),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ContactScreen();
              }))
            },
          ),
        ],
      ),
    );
  }
}
