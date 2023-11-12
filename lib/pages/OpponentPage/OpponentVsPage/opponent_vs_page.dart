import 'package:flutter/material.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/small_text.dart';

class OpponentVsPage extends StatelessWidget {
  const OpponentVsPage({super.key});

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
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 45),
          child: Column(
            children: [
              // Roulette Image
              const Image(
                image: AssetImage('assets/images/roulette-image.png'),
                width: 250,
              ),
              const SizedBox(height: 30),
              // Gamers Vs
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // First Opponent
                  Column(
                    children: const  [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/default-avatar.png'),
                      ),
                      SizedBox(height: 5),
                      SmallText(
                        text: 'Gamer',
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ],
                  ),
                  // VS text
                  const SmallText(
                    text: 'VS',
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    shadowColor: AppColors.darkOrangeColor,
                  ),
                  // Second Opponent
                  Column(
                    children: const  [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/default-avatar.png'),
                      ),
                      SizedBox(height: 5),
                      SmallText(
                        text: 'Gamer2',
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        )
    ));
  }
}