import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/question_model.dart';
import 'home_controller.dart';

final HomeController homeController = HomeController();

class DailyChallengeController extends GetxController {
  // Questions

  RxList questionList = [].obs;
  RxBool loadingQuestions = true.obs;
  RxString categoryName = ''.obs;
  void loadQuestions() async {
    try {
      questionList.clear();
      loadingQuestions(true);
      int count = await homeController.getDataCount();
      debugPrint("El numero es: $count");
      List<QuestionModel> questions = await homeController.getRandomData(count);
      // Limpia la lista existente y agrega las nuevas preguntas
      questionList.addAll(questions);
      debugPrint('preguntas cargadas con exito $questions');
      loadingQuestions(false);
    } catch (e) {
      print(e);
      print('[Error]: arango.');
    }
  }

  void changeAppBarTitle(String title) {
    categoryName.value = title;
    update();
  }

  // Clear question list
  void clearQuestions() => questionList.clear();
}
