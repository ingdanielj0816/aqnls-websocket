import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/small_text.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final Color shadowColor;
  final String labelText;
  final double fontSize;
  final Color textColor;
  final IconData? iconMaterial;
  final ImageProvider<Object>? iconImage;
  final VoidCallback onTap;
  final double iconSize;

  const CustomButton({
    super.key,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.shadowColor,
    required this.labelText,
    this.fontSize = 12.0,
    this.textColor = const Color(0xFFFFFFFF),
    this.iconMaterial,
    this.iconImage,
    this.iconSize = 22.0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return iconMaterial != null || iconImage != null
        ?
        // With Icon
        Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: backgroundColor,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    color: shadowColor,
                  )
                ]),
            child: Material(
              color: Colors.white.withOpacity(0.0),
              child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  splashColor: Colors.white.withOpacity(0.5),
                  highlightColor: Colors.transparent,
                  onTap: () {
                    onTap.call();
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          if (iconMaterial != null)
                            Icon(iconMaterial,
                                size: iconSize, color: AppColors.whiteColor),
                          if (iconImage != null)
                            Image(
                                image: iconImage!,
                                width: iconSize,
                                height: iconSize),
                          Expanded(
                            child: SmallText(
                              text: labelText,
                              fontWeight: FontWeight.w700,
                              fontSize: fontSize,
                              textAlign: TextAlign.center,
                              shadowColor: shadowColor,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          )
        :
        // Without Icon
        Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: backgroundColor,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    color: shadowColor,
                  )
                ]),
            child: Material(
              color: Colors.white.withOpacity(0.0),
              child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  splashColor: Colors.white.withOpacity(0.5),
                  highlightColor: Colors.transparent,
                  onTap: onTap,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(labelText,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                color: textColor,
                                fontSize: fontSize,
                                fontWeight: FontWeight.w700,
                                shadows: <Shadow>[
                                  Shadow(
                                    color: shadowColor,
                                    offset: const Offset(1, 2),
                                  ),
                                ],
                              ))),
                        ),
                      ],
                    ),
                  )),
            ),
          );
  }
}
