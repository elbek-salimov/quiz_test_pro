import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/size/app_size.dart';
import '../../utils/styles/app_text_styles.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(top: 200.h, left: 32.w, right: 32.w),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome',
              style: AppTextStyles.interBold.copyWith(fontSize: 30, shadows: [
                const Shadow(color: AppColors.black, blurRadius: 30)
              ]),
            ),
            120.getH(),
            Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: TextFormField(
                textAlign: TextAlign.center,
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 3) {
                    return 'Incorrect name';
                  }
                  return null;
                },
                style: AppTextStyles.poppinsRegular
                    .copyWith(letterSpacing: 2, fontSize: 18),
                decoration: InputDecoration(
                  label: const Text('Enter name'),
                  labelStyle: AppTextStyles.interRegular,
                  contentPadding: const EdgeInsets.all(14),
                  filled: true,
                  fillColor: AppColors.c_162023,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            40.getH(),
            InkWell(
              onTap: () async {
                final isValidate = formKey.currentState!.validate();
                if (isValidate) {
                  final username = nameController.text;
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setString('username', username);
                  if (context.mounted) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(
                          userName: nameController.text,
                        ),
                      ),
                    );
                  }
                }
              },
              borderRadius: BorderRadius.circular(16),
              child: Ink(
                height: 50.h,
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.20),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    'Register',
                    style: AppTextStyles.poppinsMedium.copyWith(fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
