import 'dart:convert';

import 'package:flutter/material.dart';

class QuestionModel {
  String Question = "Question";
  int id = 0;
  String Answer1 = "1";
  String Answerc = "2";
  String Answer3 = "3";
  String Answer4 = "4";
  String Category = "Category";
  QuestionModel(
      {required this.Question,
      required this.id,
      required this.Answer1,
      required this.Answerc,
      required this.Answer3,
      required this.Answer4,
      required this.Category});
  QuestionModel.fromJson(Map<String, dynamic> json) {
    try {
      id = json["id"];
      json = jsonDecode(jsonEncode(json["attributes"]));
      Question = json["Question"] ?? "";
      Answer1 = json["Answer1"] ?? "";
      Answerc = json["Answerc"] ?? "";
      Answer3 = json["Answer3"] ?? "";
      Answer4 = json["Answer4"] ?? "";
    } catch (e) {
      debugPrint("Error en :${jsonDecode(jsonEncode(json["attributes"]))}");
      debugPrint("Error:$e");
    }
  }
}
