import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallText extends StatelessWidget {

  final Color? color;
  final String text;
  final double fontSize;
  final double height;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final Color? shadowColor;

  const SmallText({super.key,
    this.color = const Color(0xFFFFFFFF),
    required this.text,
    this.fontSize = 12,
    this.height = 1.2,
    this.fontWeight = FontWeight.normal,
    this.textAlign,
    this.shadowColor
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: color,
          fontSize: fontSize,
          height: height,
          fontWeight: fontWeight,
          shadows: shadowColor != null ? <Shadow>[
            Shadow(
              color: shadowColor!,
              offset: const Offset(0, 2),
              blurRadius: 2
            ),
          ] : null,
        )
      )
    );
  }
}