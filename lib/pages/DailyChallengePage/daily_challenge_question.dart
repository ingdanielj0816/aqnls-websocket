import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/custom_button.dart';
import 'package:trivia/widgets/show_modal.dart';
import 'package:trivia/widgets/small_text.dart';

import '../../controllers/daily_challenge_controller.dart';
import '../../widgets/custom_timer.dart';

class DailyChallengeQuestion extends StatefulWidget {
  const DailyChallengeQuestion({super.key});

  @override
  State<DailyChallengeQuestion> createState() => _DailyChallengeQuestionState();
}

class _DailyChallengeQuestionState extends State<DailyChallengeQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.lightBlueColor,
        title: const SmallText(
          text: 'BONUS DIARIO',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          shadowColor: Colors.black,
        ),
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
          final dailyChallengeController = Get.find<DailyChallengeController>();
          final questionList = dailyChallengeController.questionList;
          // Obtén la lista filtrada por categoría
          if (questionList.isEmpty) {
            // Manejar el caso en que no haya preguntas disponibles
            return Center(
                child:
                    Text("No hay preguntas disponibles para esta categoría."));
          }

          final question = questionList[0];
          // Options
          final options = [
            question.Answerc,
            question.Answer1,
            question.Answer3,
            question.Answer4,
          ];
          options.shuffle();
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
                    text: question.Question,
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
                      options.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: CustomButton(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.05,
                              backgroundColor: AppColors.lightGreenColor,
                              shadowColor:
                                  AppColors.darkGreenColor.withOpacity(0.9),
                              labelText: options[index],
                              onTap: () {
                                if (question.Answerc == options[index]) {
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
