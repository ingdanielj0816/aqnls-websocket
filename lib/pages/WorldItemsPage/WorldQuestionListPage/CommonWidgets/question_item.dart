import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/small_text.dart';

import '../../WorldQuestionPage/world_question_page.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Gold quantiy
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage('assets/images/gold-icon.png'),
              width: 30,
            ),
            SizedBox(width: 5),
            SmallText(
              text: '+100',
              fontWeight: FontWeight.w800,
              fontSize: 18,
              shadowColor: Color(0xFF939393),
            )
          ],
        ),
        // Item box
        GestureDetector(
          onTap: () {
            Get.to(
              const WorldQuestionPage(),
            );
          },
          child: Stack(
            children: [
              Container(
                width: 115,
                height: 115,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/grey-box.png'),
                        fit: BoxFit.cover)),
              ),
              const Positioned(
                top: 30,
                left: 35,
                child: Image(
                  image: AssetImage('assets/images/lock-icon.png'),
                  width: 45,
                ),
              )
            ],
          ),
        ),
        // Linear Progress
        SizedBox(
          width: 115,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFF2E6FAA),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const LinearProgressIndicator(
                value: 0.4,
                minHeight: 10,
                backgroundColor: Color(0xFF412D73),
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColors.lightGreenColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
