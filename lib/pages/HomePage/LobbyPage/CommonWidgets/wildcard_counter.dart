import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trivia/utils/theme.dart';

class WilcardCounter extends StatelessWidget {
  final String quantity;
  final ImageProvider<Object> iconImage;

  const WilcardCounter({
    super.key,
    required this.quantity,
    required this.iconImage
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          quantity,
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 20,
              fontWeight: FontWeight.w900,
              shadows: <Shadow>[
                Shadow(
                  color: AppColors.lightGreenColor,
                  offset: Offset(1.2, 0),
                ),
                Shadow(
                  color: AppColors.lightGreenColor,
                  offset: Offset(-1.2, 0),
                ),
              ] ,
            )
          )
        ),
        const SizedBox(width: 5),
        Image(
          image: iconImage,
          width: 25,
        ),
      ],
    );
  }
}