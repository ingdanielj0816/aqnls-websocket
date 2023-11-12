import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trivia/controllers/daily_bonus_controller.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/custom_button.dart';
import 'package:trivia/widgets/show_modal.dart';
import 'package:trivia/widgets/custom_timer.dart';
import 'package:trivia/widgets/small_text.dart';

class DailyBonusQuestion extends StatefulWidget {
  const DailyBonusQuestion({super.key});

  @override
  State<DailyBonusQuestion> createState() => _DailyBonusQuestionState();
}

class _DailyBonusQuestionState extends State<DailyBonusQuestion> {
  @override
  Widget build(BuildContext context) {
    final dailyBonusController = Get.find<DailyBonusController>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.lightBlueColor,
        title: Obx(() {
          return SmallText(
            text: dailyBonusController.categoryName.toString(),
            fontSize: 16,
            fontWeight: FontWeight.bold,
            shadowColor: Colors.black,
          );
        }),
        automaticallyImplyLeading: false,
        actions: const [
          // Timer
          Padding(
              padding: EdgeInsets.all(15.0),
              child: CustomTimer(
                seconds: 15,
              ))
        ],
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Obx(() {
          final dailyBonusController = Get.find<DailyBonusController>();
          final questionList = dailyBonusController.questionList;
          debugPrint("questionList"); // Obtén la lista filtrada por categoría
          if (questionList.isEmpty) {
            // Manejar el caso en que no haya preguntas disponibles
            return Center(
                child:
                    Text("No hay preguntas disponibles para esta categoría."));
          }

          // Random questions
          final random = Random();
          final randomQuestion =
              questionList[random.nextInt(questionList.length)];

          // Random options
          final randomOptions = [
            randomQuestion.Answerc,
            randomQuestion.Answer1,
            randomQuestion.Answer3,
            randomQuestion.Answer4,
          ];
          randomOptions.shuffle();
          // print(randomOptions);

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Question
              Container(
                width: 336,
                height: 163,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: AppColors.lightGreenColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 8),
                        color: AppColors.darkGreenColor.withOpacity(0.9),
                      )
                    ]),
                child: Center(
                  child: SmallText(
                    text: randomQuestion.Question,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 78),
              // Options
              Column(
                children: [
                  ...List.generate(
                      randomOptions.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: CustomButton(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.05,
                              backgroundColor: AppColors.lightGreenColor,
                              shadowColor:
                                  AppColors.darkGreenColor.withOpacity(0.9),
                              labelText: randomOptions[index],
                              onTap: () {
                                if (randomQuestion.Answerc ==
                                    randomOptions[index]) {
                                  showModal(context, 'success');
                                } else {
                                  showModal(context, 'error');
                                }
                              },
                            ),
                          ))
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}
