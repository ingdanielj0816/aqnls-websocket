import 'package:flutter/material.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/small_text.dart';

class AvatarWithStar extends StatelessWidget {
  final String level;

  const AvatarWithStar({
    super.key, 
    required this.level
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Column(
        children: [
          SmallText(
            text: level,
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
        ],
      ),
    );
  }
}
