import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:trivia/pages/CategoriesPage/categories_page.dart';
import 'package:trivia/pages/GameModePage/classic_page.dart';
import 'package:trivia/pages/GameModePage/contrareloj_question.dart';
import 'package:trivia/pages/GameModePage/misterio_page.dart';
import 'package:trivia/pages/GameModePage/random_page.dart';
import 'package:trivia/pages/WorldItemsPage/world_items_page.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/custom_app_bar.dart';
import 'package:trivia/widgets/custom_button.dart';
import 'package:trivia/widgets/small_text.dart';

import '../../controllers/daily_bonus_controller.dart';
import '../../controllers/daily_challenge_controller.dart';

class GameModePage extends StatelessWidget {
  const GameModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 40, bottom: 40, right: 30, left: 30),
          child: Column(
            children: [
              // CustomAppBar
              CustomAppBar(
                onPressed: () {
                  Get.back();
                },
              ),
              const SizedBox(height: 50),
              // Game Modes
              Container(
                width: 330,
                height: 548,
                decoration: BoxDecoration(
                    color: AppColors.lightBlueColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 16,
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SmallText(
                        text: 'MODO DE JUEGO',
                        color: AppColors.whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        shadowColor: Colors.black,
                      ),
                      const SizedBox(height: 15),
                      CustomButton(
                          width: 195,
                          height: 45,
                          backgroundColor: AppColors.lightGreenColor,
                          shadowColor: AppColors.darkGreenColor,
                          labelText: 'CLÁSICO',
                          fontSize: 14,
                          iconMaterial: Icons.play_circle,
                          iconSize: 25,
                          onTap: () {
                            // TODO: Implement action
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const ClassicPage(),
                            );
                          }),
                      const SizedBox(height: 10),
                      CustomButton(
                          width: 195,
                          height: 45,
                          backgroundColor: AppColors.lightOrangeColor,
                          shadowColor: AppColors.darkOrangeColor,
                          labelText: 'CONTRARELOJ',
                          fontSize: 14,
                          iconMaterial: Icons.timer_outlined,
                          iconSize: 25,
                          onTap: () {
                            // TODO: Implement action
                            final dailyChallengeController =
                                Get.find<DailyChallengeController>();
                            dailyChallengeController.loadQuestions();
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const ContrarelojQuestion(),
                            );
                          }),
                      const SizedBox(height: 10),
                      CustomButton(
                          width: 195,
                          height: 45,
                          backgroundColor: AppColors.lightGreenColor,
                          shadowColor: AppColors.darkGreenColor,
                          labelText: 'CATEGORÍAS',
                          fontSize: 14,
                          iconMaterial: Icons.category,
                          iconSize: 25,
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(context,
                                screen: const CategoriesPage(),
                                withNavBar: false);
                          }),
                      const SizedBox(height: 10),
                      CustomButton(
                          width: 195,
                          height: 45,
                          backgroundColor: AppColors.lightOrangeColor,
                          shadowColor: AppColors.darkOrangeColor,
                          labelText: 'MISTERIO',
                          fontSize: 14,
                          iconMaterial: Icons.search,
                          iconSize: 25,
                          onTap: () {
                            // TODO: Implement action
                            final dailyBonusController =
                                Get.find<DailyBonusController>();
                            dailyBonusController
                                .loadQuestions("Misterios y enigmas");
                            dailyBonusController
                                .changeAppBarTitle("Misterios y enigmas");
                            Get.back();
                            PersistentNavBarNavigator.pushNewScreen(context,
                                screen: const MisterioQuestion(),
                                pageTransitionAnimation:
                                    PageTransitionAnimation.slideUp);
                          }),
                      const SizedBox(height: 10),
                      CustomButton(
                          width: 195,
                          height: 45,
                          backgroundColor: AppColors.lightGreenColor,
                          shadowColor: AppColors.darkGreenColor,
                          labelText: 'ALEATORIO',
                          fontSize: 14,
                          iconMaterial: Icons.loop,
                          iconSize: 25,
                          onTap: () {
                            // TODO: Implement action
                            final dailyChallengeController =
                                Get.find<DailyChallengeController>();
                            dailyChallengeController.loadQuestions();
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const RandomQuestion(),
                            );
                          }),
                      const SizedBox(height: 10),
                      CustomButton(
                          width: 195,
                          height: 45,
                          backgroundColor: AppColors.lightOrangeColor,
                          shadowColor: AppColors.darkOrangeColor,
                          labelText: 'AVENTURA',
                          fontSize: 14,
                          iconMaterial: Icons.terrain,
                          iconSize: 25,
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(context,
                                screen: WorldItemsPage(), withNavBar: false);
                          }),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 79),
              CustomButton(
                  width: 225,
                  height: 50,
                  backgroundColor: AppColors.lightBlueColor,
                  shadowColor: AppColors.darkBlueColor,
                  labelText: 'REGLAS DEL JUEGO',
                  fontSize: 14,
                  onTap: () {
                    // TODO: Implement action
                  })
            ],
          ),
        ),
      ),
    );
  }
}
