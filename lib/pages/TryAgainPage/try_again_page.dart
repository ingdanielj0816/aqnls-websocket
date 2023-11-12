import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trivia/pages/HomePage/home_page.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/custom_button.dart';
import 'package:trivia/widgets/small_text.dart';

class TryAgainPage extends StatefulWidget {
  const TryAgainPage({super.key});

  @override
  State<TryAgainPage> createState() => _TryAgainPageState();
}

class _TryAgainPageState extends State<TryAgainPage> {

  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _playMusic();
  }

  Future<void> _playMusic() async {
    await _audioPlayer.play(AssetSource('audio/loser-effect.mp3'));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.lightBlueColor,
        title: const SmallText(
          text: 'AVENTURA',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          shadowColor: Colors.black,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg-try-again.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text
              SizedBox(
                width: 300,
                child: Column(
                  children: const [
                    SmallText(
                      text: 'INTENTALO DE NUEVO',
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      textAlign: TextAlign.center,
                    ), 
                  ],
                )
              ),
              // Next button
              CustomButton(
                width: 240,
                height: 50, 
                backgroundColor: AppColors.lightGreenColor, 
                shadowColor: AppColors.darkGreenColor, 
                labelText:'INTENTAR DE NUEVO',
                fontSize: 16,
                onTap: (){
                  Get.to(const HomePage());
                },
              ),
            ],
          ),
        )
    ));
  }
}