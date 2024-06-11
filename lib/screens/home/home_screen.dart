import 'package:flutter/material.dart';
import 'package:quiz_test_pro/screens/home/widgets/subjects_item.dart';

import '../../data/data_repository.dart';
import '../../models/subject_model.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/size/app_size.dart';
import '../../utils/styles/app_text_styles.dart';
import '../start/start_screen.dart';
import 'widgets/menu_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: NavDrawer(userName: userName),
      appBar: AppBar(
        backgroundColor: AppColors.c_161616,
        centerTitle: true,
        title: Text(
          'Subjects',
          style: AppTextStyles.interMedium.copyWith(fontSize: 20.w),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50.h, right: 32.w, left: 32.w),
            child: Column(
              children: [
                ...List.generate(DataRepository().allSubjects.length, (index) {
                  SubjectModel subject = DataRepository().allSubjects[index];
                  return SubjectsItem(
                    time:
                        '${((subject.questions.length * 30) ~/ 60).toString().padLeft(2, '0')} : ${((subject.questions.length * 30) % 60).toString().padLeft(2, '0')}',
                    subjectModel: subject,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return StartScreen(subjectModel: subject);
                      }));
                    },
                  );
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
