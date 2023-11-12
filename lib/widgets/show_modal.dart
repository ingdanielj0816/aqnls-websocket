import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trivia/pages/TryAgainPage/try_again_page.dart';
import 'package:trivia/pages/WinnerPage/winner_page.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/custom_button.dart';
import 'package:trivia/widgets/small_text.dart';

Future<void> showModal(BuildContext context, messageType) async {
  await showDialog(
    context: context,
    builder: (_) => Dialog(
      backgroundColor: Colors.black54.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0)
      ),
      child: Container(
        height: 400,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text
            SmallText(
              text: messageType == 'success' ? 'CORRECTO' : 'INCORRECTO',
              fontSize: 25,
              fontWeight: FontWeight.w900,
              shadowColor: messageType == 'success' ? AppColors.darkGreenColor : AppColors.lightOrangeColor,
            ),
            // Icons
            SizedBox(
              width: 120,
              height: 190,
              child: messageType == 'success' ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Coin Icon
                  const Image(
                    image: AssetImage('assets/images/coins.png'),
                    width: 45,
                  ),
                  // Quantity
                  const SmallText(
                    text: '+100',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    shadowColor: AppColors.darkOrangeColor,
                  ),
                  // Chest icon
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: BounceInDown(
                          child: const Image(
                            image: AssetImage('assets/images/chest-icon.png'),
                            width: 120,
                          ),
                        ),
                      ),
                      FutureBuilder(
                        future: Future.delayed(const Duration(milliseconds: 700)),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            return Positioned(
                              left: 12,
                              top: 6,
                              child: BounceInDown(
                                duration: const Duration(milliseconds: 1200),
                                child: const Image(
                                  image: AssetImage('assets/images/animated-coins.gif'),
                                  width: 90,
                                ),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        }
                      )
                    ],
                  ),
                ],
              ):
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const  [
                  // Chest icon
                  Image(
                    image: AssetImage('assets/images/error-icon.png'),
                    width: 120,
                  ),
                ],
              ),
            ),
            // Button: Continue
            CustomButton(
              width: 225, 
              height: 46, 
              backgroundColor: AppColors.lightOrangeColor, 
              shadowColor: AppColors.darkOrangeColor, 
              labelText: 'CONTINUAR',
              onTap: () => messageType == 'success' ? Get.to(const WinnerPage()) : Get.to(const TryAgainPage())
            )
          ],
        )
      ),
    )
  );
}