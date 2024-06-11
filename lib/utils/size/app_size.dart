import 'package:flutter/material.dart';

double height = 0.0;
double width = 0.0;

extension SizeUtils on int {
  double get h => (this / 844) * height;

  double get w => (this / 390) * width;

  SizedBox getH() {
    return SizedBox(
      height: (this / 844) * height,
    );
  }

  SizedBox getW() {
    return SizedBox(
      width: (this / 390) * width,
    );
  }
}