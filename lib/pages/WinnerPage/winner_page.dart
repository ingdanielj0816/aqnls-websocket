import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trivia/controllers/music_controller.dart';
import 'package:trivia/pages/HomePage/home_page.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/custom_button.dart';
import 'package:trivia/widgets/small_text.dart';

class WinnerPage extends StatelessWidget {
  const WinnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final musicBonusController = Get.find<MusicController>();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg-winner.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 40 ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text
               const SizedBox(
                width: 300,
                child: Column(
                  children:  [
                    SmallText(
                      text: '¡BIEN HECHO!',
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                    ),
                    SizedBox(height: 15),
                    SmallText(
                      text: 'GANASTE ESTA RONDA, SIGUE GANANDO PUNTOS',
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              ),
               const SizedBox(height: 30),
              // Icons and gif
               const SizedBox(
                width: 300,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/images/gold-icon.png'),
                        ),
                        SizedBox(width: 5),
                        SmallText(
                          text: '+100',
                          fontSize: 35,
                          fontWeight: FontWeight.w900,
                          shadowColor: AppColors.lightOrangeColor,
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
               const SizedBox(
                width: 300,
                height: 300, 
                child: Stack(
                  children: [
                    Image(
                      image: AssetImage('assets/images/winner-gif.png'),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Center(
                      child: Image(
                        image: AssetImage('assets/images/confeti.gif'),
                        fit: BoxFit.cover,
                        width: 150,
                      ),
                    )
                  ],
                ),
              ),
               const SizedBox(height: 40),
              // Next button
              CustomButton(
                width: 128,
                height: 46, 
                backgroundColor: AppColors.lightOrangeColor, 
                shadowColor: AppColors.darkOrangeColor, 
                labelText:'SIGUIENTE',
                fontSize: 14,
                onTap: (){
                  musicBonusController.isPlaying.value = false;
                  Get.to(const HomePage());
                },
              ),

            ],
          ),
        )
    ));
  }
}