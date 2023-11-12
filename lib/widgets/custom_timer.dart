import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:trivia/widgets/small_text.dart';

class CustomTimer extends StatelessWidget {
  final int seconds;

  const CustomTimer({
    super.key,
    required this.seconds
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Countdown(
        seconds: seconds,
        build: (BuildContext context, double time) {
          return SmallText(
            text: '$time',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            shadowColor: Colors.black,
            height: 1.5,
            textAlign: TextAlign.center,
          );
        },
        interval: const Duration(milliseconds: 100),
        onFinished: () {
          print('Timer is done!');
        },
      ),
    );
  }
}
