import 'package:flutter/material.dart';
import 'package:quiz_test_pro/screens/splash/splash_screen.dart';
import 'package:quiz_test_pro/utils/colors/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: AppColors.black,
      ),
      home: const SplashScreen(),
    );
  }
}
