import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/custom_button.dart';
import 'package:trivia/widgets/show_modal.dart';
import 'package:trivia/widgets/small_text.dart';

import '../../controllers/daily_challenge_controller.dart';
import '../../widgets/custom_timer.dart';

class ContrarelojQuestion extends StatefulWidget {
  const ContrarelojQuestion({super.key});

  @override
  State<ContrarelojQuestion> createState() => _ContrarelojQuestionState();
}

class _ContrarelojQuestionState extends State<ContrarelojQuestion> {
  @override
  Widget build(BuildContext context) {
    int wins = 0;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.lightBlueColor,
        title: const SmallText(
          text: 'CONTRARELOJ',
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
                seconds: 60,
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
                                  setState(() {
                                    wins++; // Incrementar el contador de victorias
                                  });
                                  debugPrint('Victorias: $wins');
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

int handleAnswer(BuildContext context, bool isCorrect) {
  int wins = 0;
  if (isCorrect) {
    wins++;
    final dailyChallengeController = Get.find<DailyChallengeController>();
    dailyChallengeController.loadQuestions();
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: const ContrarelojQuestion(),
    );
    // Llama a una función para cargar la siguiente pregunta
  } else {
    showModal(context, 'error');
  }
  return wins;
}
