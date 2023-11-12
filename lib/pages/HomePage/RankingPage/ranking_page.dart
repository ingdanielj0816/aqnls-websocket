import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:trivia/pages/HomePage/RankingPage/FriendsRankingPage/friends_ranking_page.dart';
import 'package:trivia/pages/HomePage/RankingPage/TimeRankingPage/time_ranking_page.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/custom_button.dart';
import 'package:trivia/widgets/small_text.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.lightBlueColor,
        title: const SmallText(
          text: 'RANKING',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          shadowColor: Colors.black,
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
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              SizedBox(
                width: 220,
                child: Column(
                  children: [
                    const SmallText(
                      text: 'LV4',
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      shadowColor: Colors.black,
                    ),
                    const SizedBox(height: 20),
                    Stack(
                      children: [
                        SizedBox(
                          width: 220,
                          child: CircleAvatar(
                            radius: 50,
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: const BoxDecoration(
                                color: AppColors.lightBlueColor,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage('assets/images/default-avatar.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 40,
                          child: Image(
                            image: AssetImage('assets/images/star-icon.png'),
                            width: 50,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      width: double.infinity, 
                      height: 40, 
                      backgroundColor: AppColors.lightOrangeColor, 
                      shadowColor: AppColors.darkOrangeColor, 
                      labelText: 'RANKING TIEMPO', 
                      fontSize: 16,
                      onTap: (){
                        PersistentNavBarNavigator.pushNewScreen(
                          context, 
                          screen: const TimeRankingPage(),
                        );
                      }
                    ),
                    const SizedBox(height: 25),
                    CustomButton(
                      width: double.infinity, 
                      height: 40, 
                      backgroundColor: AppColors.lightGreenColor, 
                      shadowColor: AppColors.darkGreenColor, 
                      labelText: 'RANKING AMIGOS', 
                      fontSize: 16,
                      onTap: (){
                        PersistentNavBarNavigator.pushNewScreen(
                          context, 
                          screen: const FriendsRankingPage(),
                        );
                      }
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    ));
  }
}