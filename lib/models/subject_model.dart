import 'package:quiz_test_pro/models/level_model.dart';
import 'package:quiz_test_pro/models/quiz_model.dart';
import 'package:flutter/material.dart';
import 'package:quiz_test_pro/utils/functions/functions.dart';

class SubjectModel {
  final String subjectName;
  final String banner;
  final String bannerTitle;
  final Color bannerColor;
  final String chapter;
  final List<QuizModel> questions;
  final LevelModel level;

  SubjectModel({
    required this.subjectName,
    required this.questions,
    required this.level,
    required this.chapter,
    required this.banner,
    required this.bannerTitle,
    required this.bannerColor,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      subjectName: json['subject_name'] as String? ?? '',
      chapter: json['chapter'] as String? ?? '',
      banner: json['banner'] as String? ?? '',
      bannerTitle: json['banner_title'] as String? ?? '',
      bannerColor: (json['banner_color'] as String? ?? '').toColor(),
      questions: (json['questions'] as List?)?.map((e) => QuizModel.fromJson(e)).toList() ?? [],
      level: getLevelFromString(json['level'] as String? ?? 'medium'),
    );
  }
}

LevelModel getLevelFromString (String level) {
  switch(level) {
    case 'easy':
      {
        return LevelModel.easy;
      }
    case 'hard':
      {
        return LevelModel.hard;
      }
    default:
      {
        return LevelModel.medium;
      }
  }
}