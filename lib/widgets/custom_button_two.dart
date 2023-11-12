import 'package:flutter/material.dart';
import 'package:trivia/widgets/small_text.dart';

class CustomButtonTwo extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final Color shadowColor;
  final String title;
  final String subTitle;
  final double titleFontSize;
  final double subTitleFontSize;
  final ImageProvider<Object> iconImage;
  final VoidCallback onTap;
  final double iconSize;

  const CustomButtonTwo({
    super.key,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.shadowColor,
    required this.title,
    required this.subTitle,
    this.titleFontSize = 10.0,
    this.subTitleFontSize = 7.0,
    required this.iconImage,
    this.iconSize = 22.0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    Image( image: iconImage, width: iconSize, height: iconSize),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Title
                          SmallText(
                            text: title,
                            fontWeight: FontWeight.bold,
                            fontSize: titleFontSize,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 2),
                          // Subtitle
                          SmallText(
                            text: subTitle,
                            fontWeight: FontWeight.w500,
                            fontSize: subTitleFontSize,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
