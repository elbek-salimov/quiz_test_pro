import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/subject_model.dart';

class DataRepository {
  DataRepository._();

  static final DataRepository instance = DataRepository._();

  factory DataRepository() => instance;

  List<SubjectModel> allSubjects = [];

  Future<void> loadSubjects() async {
    String data = await rootBundle.loadString('assets/data/test_data.json');
    var decodedData = jsonDecode(data);
    allSubjects = (decodedData["data"] as List?)
            ?.map((e) => SubjectModel.fromJson(e))
            .toList() ??
        [];
  }
}
