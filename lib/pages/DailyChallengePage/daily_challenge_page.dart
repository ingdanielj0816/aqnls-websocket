import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:trivia/controllers/daily_challenge_controller.dart';
import 'package:trivia/pages/DailyChallengePage/CommonWidgets/challenge_item.dart';
import 'package:trivia/pages/DailyChallengePage/daily_challenge_question.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/custom_button.dart';
import 'package:trivia/widgets/points_and_coins.dart';
import 'package:trivia/widgets/small_text.dart';

import '../../controllers/home_controller.dart';

class DailyChallengePage extends StatelessWidget {
  DailyChallengePage({super.key});

  final List<Map<String, String>> _wildcards = [
    {'name': 'parrot', 'image': 'assets/images/parrot-icon.png'},
    {'name': 'chest', 'image': 'assets/images/chest-icon.png'},
    {'name': 'coins', 'image': 'assets/images/coins.png'}
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.lightBlueColor,
        title: const SmallText(
          text: 'DESAFIO DIARIO',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          shadowColor: Colors.black,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              SizedBox(
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Timer
                    const SmallText(
                      text: '23:38:09',
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      shadowColor: AppColors.lightGreenColor,
                    ),
                    // Rewards
                    Container(
                      width: 308,
                      height: 400,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: AppColors.darkBlueColor,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 6),
                              color: Color(0xFF051932),
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Reward Items
                          ...List.generate(
                              _wildcards.length,
                              (index) => ChallengeItem(
                                    imagePath: _wildcards[index]['image']!,
                                  )),
                          // Button continue
                          CustomButton(
                              width: 220,
                              height: 46,
                              backgroundColor: AppColors.lightOrangeColor,
                              shadowColor: AppColors.darkOrangeColor,
                              labelText: 'JUGAR',
                              fontSize: 20,
                              onTap: () {
                                _onTap();
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: const DailyChallengeQuestion(),
                                );
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // Points and Coins
              const PointsAndCoins()
            ],
          ),
        ),
      ),
    );
  }

  void _onTap() {
    final dailyChallengeController = Get.find<DailyChallengeController>();
    dailyChallengeController.loadQuestions();
    dailyChallengeController.changeAppBarTitle("Desafio Diario");
  }
}
