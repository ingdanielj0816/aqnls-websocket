import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/small_text.dart';

class LevelProgress extends StatelessWidget {
  const LevelProgress({super.key});

  final double _progressValue = 0.4;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 336,
      height: 132,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFE7E7E7),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Stack(
        children: [
          Positioned(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0,4),
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                  )
                ]
              ),
              child: Row(
                children: [
                  const Image(
                    image: AssetImage('assets/images/trophy-icon.png'),
                    width: 70,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Text
                      Text(
                        'Completa los 8 niveles para obtener \n la recompensa',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            color: Color(0xFF424242),
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          )
                        )
                      ),
                      // Linear Progress
                      Stack(
                        children: [
                          SizedBox(
                            width: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: LinearProgressIndicator(
                                value: _progressValue,
                                minHeight: 40,
                                backgroundColor: const Color(0xFFD8D8D8),
                                valueColor: const AlwaysStoppedAnimation<Color>(AppColors.lightGreenColor),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 8,
                            left: 90,
                            child: SmallText(
                              text: '${(_progressValue * 100).toStringAsFixed(0)}%',
                              shadowColor: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                      // Missions Completed
                      Text(
                        '2/8',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            color: Color(0xFF878787),
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          )
                        )
                      ),
                    ]
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}