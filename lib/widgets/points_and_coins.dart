import 'package:flutter/material.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/small_text.dart';

class PointsAndCoins extends StatelessWidget {
  const PointsAndCoins({super.key});

  @override
  Widget build(BuildContext context) {  
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
          width: 68,
          height: 34,
          decoration: BoxDecoration(
            color: AppColors.lightBlueColor,
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 4),
                color: AppColors.darkBlueColor,
              )
            ],
            borderRadius: BorderRadius.circular(10)
          ),
          child: const Center(
            child: SmallText(
              text: '100 \n PUNTOS',
              fontSize: 8.0,
              fontWeight: FontWeight.bold,
              shadowColor: AppColors.lightOrangeColor,
              textAlign: TextAlign.center,
            ),
          ),
          ),
          const SizedBox(width: 10),
          Container(
          width: 68,
          height: 34,
          decoration: BoxDecoration(
            color: AppColors.lightBlueColor,
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 4),
                color: AppColors.darkBlueColor,
              )
            ],
            borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                image: AssetImage('assets/images/coins.png'),
                width: 20,
              ),
              SmallText(
                text: '100',
                fontSize: 10,
                fontWeight: FontWeight.bold,
                shadowColor: AppColors.lightOrangeColor,
              )
            ],
          )
          )
        ],
      ),
    );
  }
}