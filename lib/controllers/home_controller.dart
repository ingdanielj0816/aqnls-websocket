import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:trivia/models/question_model.dart';
import 'package:trivia/utils/app_constants.dart';
import 'dart:math';

import '../api/api_client.dart';

class HomeController extends GetxController {
  final _apiClient = ApiClient();

  Future<List<QuestionModel>> getDataByCategory(String questionCategory) async {
    List<QuestionModel> questions = [];

    try {
      final response = await _apiClient.getData(AppConstants.baseURL,
          "${AppConstants.QuestionsCollection}?filters[Category][\$eq]=$questionCategory");

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final data = jsonResponse['data'];

        for (var item in data) {
          questions.add(QuestionModel.fromJson(item));
        }
      } else {
        print(
            "Error occurred: ${response.statusCode} and error is ${response.body}");
      }
    } catch (error) {
      print("Error occurred: $error");
    }

    return questions;
  }

  Future<int> getDataCount() async {
    int count = 0;
    try {
      Http.Response response = await _apiClient.getData(
          AppConstants.baseURL, AppConstants.QuestionsCollection);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final jsonmeta = jsonDecode(jsonEncode(jsonResponse['meta']));
        final jsonpagination = jsonDecode(jsonEncode(jsonmeta['pagination']));
        count = jsonpagination['total'];
      } else {
        print(
            "Error occurred: ${response.statusCode} and error is ${response.body}");
      }
    } catch (error) {
      print("Error occurred: $error");
    }

    return count;
  }

  Future<List<QuestionModel>> getRandomData(int count) async {
    List<QuestionModel> questions = [];
    if (count > 0) {
      // Obtener una pregunta aleatoria dentro del rango del recuento
      final random = Random();
      final randomId = random.nextInt(count);

      try {
        final response = await _apiClient.getData(AppConstants.baseURL,
            "${AppConstants.QuestionsCollection}/$randomId");

        if (response.statusCode == 200) {
          final jsonResponse = json.decode(response.body);
          final data = jsonDecode(jsonEncode(jsonResponse['data']));

          questions.add(QuestionModel.fromJson(data));
        } else {
          debugPrint(
              "Error occurred: ${response.statusCode} and error is ${response.body}");
        }
      } catch (error) {
        debugPrint("Error occurred: $error");
      }
    }

    return questions;
  }
}
