import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:animate_do/animate_do.dart';

import 'package:trivia/utils/theme.dart';
import 'package:trivia/pages/DailyBonusPage/daily_bonus_page.dart';
import 'package:trivia/pages/DailyChallengePage/daily_challenge_page.dart';
import 'package:trivia/pages/GameModePage/game_mode_page.dart';
import 'package:trivia/pages/HomePage/LobbyPage/CommonWidgets/wildcard_counter.dart';
import 'package:trivia/pages/LevelsPage/levels_page.dart';
import 'package:trivia/pages/OpponentPage/opponent_page.dart';
import 'package:trivia/widgets/custom_button.dart';
import 'package:trivia/widgets/custom_button_two.dart';
import 'package:trivia/widgets/small_text.dart';

class LobbyPage extends StatelessWidget {
  const LobbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              // Ads section
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.amber[500],
                      ),
                      child: const Center(
                        child: SmallText(
                          text: '¡ANUNCIO!',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              // Body content
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10, left: 30, right: 30),
                child: Column(
                  children: [
                    // Gamer Stats
                    SizedBox(
                      height: 80,
                      child: Row(
                        children: [
                          // Gamer info
                          Expanded(
                            flex: 3,
                            child: Container(
                              width: 300,
                              height: 80, //* For testing
                              decoration: const BoxDecoration(
                                color: AppColors.lightBlueColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0), 
                                  bottomLeft: Radius.circular(20.0),
                                )
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                                child: Row(
                                  children: [
                                    // Profile Image
                                    const CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      radius: 25,
                                      backgroundImage: AssetImage('assets/images/default-avatar.png'),
                                    ),
                                    const SizedBox(width: 20),
                                    // Info box
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        SmallText(
                                          text: 'Gamer',
                                          fontWeight: FontWeight.bold,
                                        ),
                                        SmallText(
                                          text: '0 puntos',
                                        ),
                                        SmallText(
                                          text: 'Nivel 1 (0%)',
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    // Bars icon
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Pulse(
                                          infinite: true,
                                          duration: const Duration(milliseconds: 2000),
                                          child: IconButton(
                                            icon: const Icon(Icons.equalizer, size: 35),
                                            color: const Color(0xFFFF9934),
                                            onPressed: () {
                                              PersistentNavBarNavigator.pushNewScreen(
                                                context, 
                                                screen: const LevelsPage(),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    )
                                  ]
                                ),
                              ),
                            ),
                          ),
                          // Gamer coins
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: AppColors.lightGreenColor,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20.0), 
                                  bottomRight: Radius.circular(20.0),
                                )
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Image(
                                    image: AssetImage('assets/images/coins.png'),
                                    width: 45,
                                  ),
                                  SmallText(
                                    text: '500',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    shadowColor: AppColors.darkGreenColor,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Game options
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          width: 155, 
                          height: 75, 
                          backgroundColor: AppColors.lightGreenColor, 
                          shadowColor: AppColors.darkGreenColor, 
                          labelText: 'BONUS DIARIO',
                          iconImage: const AssetImage('assets/images/bonus-icon.png'),
                          iconSize: 50,
                          onTap: (){
                            // Navigate to DailyBonusPage (Roulette)
                            PersistentNavBarNavigator.pushNewScreen(
                              context, 
                              screen: const DailyBonusPage(),
                            );
                          }
                        ),
                        CustomButton(
                          width: 155,
                          height: 75, 
                          backgroundColor: AppColors.lightOrangeColor, 
                          shadowColor: AppColors.darkOrangeColor, 
                          labelText: 'DESAFÍO DIARIO',
                          iconImage: const AssetImage('assets/images/challenge-icon.png'),
                          iconSize: 50,
                          onTap: (){
                            // Navigate to DailyChallengePage
                            PersistentNavBarNavigator.pushNewScreen(
                              context, 
                              screen: DailyChallengePage(),
                            );
                          }
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Roulette image
                    GestureDetector(
                      onTap: (){
                        PersistentNavBarNavigator.pushNewScreen(
                          context, 
                          screen: const GameModePage(),
                          withNavBar: false
                        );
                      },
                      child: const Image(
                        image: AssetImage('assets/images/roulette-image.png'),
                        width: 260,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Buttons: Play and Multiplayer
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          width: 155, 
                          height: 45, 
                          backgroundColor: AppColors.lightOrangeColor, 
                          shadowColor: AppColors.darkOrangeColor, 
                          labelText: 'JUGAR',
                          onTap: (){
                            PersistentNavBarNavigator.pushNewScreen(
                              context, 
                              screen: const GameModePage(),
                              withNavBar: false
                            );
                          }
                        ),
                        CustomButton(
                          width: 155, 
                          height: 45, 
                          backgroundColor: AppColors.lightGreenColor, 
                          shadowColor: AppColors.darkGreenColor, 
                          labelText: 'MULTIPLAYER',
                          onTap: (){
                            PersistentNavBarNavigator.pushNewScreen(
                              context, 
                              screen: const OpponentPage(),
                            );
                          }
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    // Buttons: Invite a friend and video reward
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButtonTwo(
                          width: 155, 
                          height: 72, 
                          backgroundColor: AppColors.lightBlueColor, 
                          shadowColor: AppColors.darkBlueColor, 
                          title: 'INVITA UN AMIGO',
                          subTitle: 'ENVIAR ENLACE',
                          iconImage: const AssetImage('assets/images/invite-icon.png'),
                          iconSize: 60,
                          onTap: (){
                            // TODO: Implement action
                          }
                        ),
                        CustomButtonTwo(
                          width: 155, 
                          height: 72, 
                          backgroundColor: AppColors.lightBlueColor, 
                          shadowColor: AppColors.darkBlueColor, 
                          title: 'OBSERVA',
                          subTitle: '¡RECOMPENSA GRATIS!',
                          iconImage: const AssetImage('assets/images/video-reward-icon.png'),
                          iconSize: 60,
                          onTap: (){
                            // TODO: Implement action
                          }
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    // Wildcard counter
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        WilcardCounter(
                          quantity: '1', 
                          iconImage: AssetImage('assets/images/parrot-icon.png'),
                        ),
                        WilcardCounter(
                          quantity: '0', 
                          iconImage: AssetImage('assets/images/thor-icon.png'),
                        ),
                        WilcardCounter(
                          quantity: '7', 
                          iconImage: AssetImage('assets/images/third-eye-icon.png'),
                        ),
                        WilcardCounter(
                          quantity: '12', 
                          iconImage: AssetImage('assets/images/diamond-icon.png'),
                        ),
                        WilcardCounter(
                          quantity: '3', 
                          iconImage: AssetImage('assets/images/hourglass-icon.png'),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
