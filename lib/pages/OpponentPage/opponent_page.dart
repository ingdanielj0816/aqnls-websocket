import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:trivia/pages/OpponentPage/OpponentSearchPage/opponent_search_page.dart';
import 'package:trivia/pages/OpponentPage/OpponentVsPage/opponent_vs_page.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/custom_button.dart';
import 'package:trivia/widgets/small_text.dart';

class OpponentPage extends StatelessWidget {
  const OpponentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.lightBlueColor,
        title: const SmallText(
          text: 'OPONENTE',
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
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            children: [
              SizedBox(
                width: 220,
                child: Column(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 70,
                      color: AppColors.whiteColor,
                    ),
                    CustomButton(
                      width: double.infinity, 
                      height: 40, 
                      backgroundColor: AppColors.lightOrangeColor, 
                      shadowColor: AppColors.darkOrangeColor, 
                      labelText: 'ALEATORIO', 
                      fontSize: 18,
                      onTap: (){
                        PersistentNavBarNavigator.pushNewScreen(
                          context, 
                          screen: const OpponentVsPage(),
                        );
                      }
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: 220,
                child: Column(
                  children: [
                    const Icon(
                      Icons.search,
                      size: 70,
                      color: AppColors.whiteColor,
                    ),
                    CustomButton(
                      width: double.infinity, 
                      height: 40, 
                      backgroundColor: AppColors.lightGreenColor, 
                      shadowColor: AppColors.darkGreenColor, 
                      labelText: 'BUSCAR', 
                      fontSize: 18,
                      onTap: (){
                        PersistentNavBarNavigator.pushNewScreen(
                          context, 
                          screen: const OpponentSearchPage(),
                        );
                      }
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: 220,
                child: Column(
                  children: [
                    const Icon(
                      Icons.people,
                      size: 70,
                      color: AppColors.whiteColor,
                    ),
                    CustomButton(
                      width: double.infinity, 
                      height: 40, 
                      backgroundColor: AppColors.lightOrangeColor, 
                      shadowColor: AppColors.darkOrangeColor, 
                      labelText: 'AMIGOS', 
                      fontSize: 18,
                      onTap: (){
                        // TODO: Friends Opponent
                      }
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    ));
  }
}