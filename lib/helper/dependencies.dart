import 'package:get/get.dart';
import 'package:trivia/controllers/daily_bonus_controller.dart';
import 'package:trivia/controllers/daily_challenge_controller.dart';
import 'package:trivia/controllers/music_controller.dart';
import 'package:trivia/controllers/world_question_list_controller.dart';

void configure() {
  Get.put<DailyBonusController>(DailyBonusController());
  Get.put<DailyChallengeController>(DailyChallengeController());
  Get.put<WorldQuestionListController>(WorldQuestionListController());
  Get.put<MusicController>(MusicController());
}
