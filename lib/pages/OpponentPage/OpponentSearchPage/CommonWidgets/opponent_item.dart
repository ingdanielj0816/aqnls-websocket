import 'package:flutter/material.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/small_text.dart';

class OpponentItem extends StatelessWidget {
  final String name;
  final String level;

  const OpponentItem({
    super.key, 
    required this.name, 
    required this.level
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 90,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.lightBlueColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 5),
            color: AppColors.darkBlueColor
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/default-avatar.png'),
          ),
          SmallText(
            text: name,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          SmallText(
            text: level,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}