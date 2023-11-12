import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RankingItems extends StatelessWidget {
  const RankingItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 170,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Image(
                  image: AssetImage('assets/images/default-avatar.png'),
                  width: 30,
                ),
                Text(
                  'USER25154',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      color: Color(0xFF898989),
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    )
                  )
                ),
                Stack(
                  children:  [
                    const Image(
                      image: AssetImage('assets/images/bg-level.png'),
                      width: 25,
                    ),
                    Positioned(
                      top: 9,
                      left: 3,
                      child: Text(
                        'LV4',
                        style: GoogleFonts.changaOne(
                          textStyle: const TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                          ),
                          shadows: [
                            const Shadow(
                              offset: Offset(0,2),
                              color: Color(0xFFB82E00),
                              blurRadius: 2,
                            )
                          ]
                        )
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  [
                const Image(
                  image: AssetImage('assets/images/thunder-icon.png'),
                  width: 18,
                ),
                const Image(
                  image: AssetImage('assets/images/gold-icon.png'),
                  width: 28,
                ),
                Text(
                  '14500',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                    shadows: const [
                      Shadow(
                        offset: Offset(1.5, 1.5),
                        color: Colors.black,
                        blurRadius: 5
                      ),
                      Shadow(
                        offset: Offset(-1.5, 0),
                        color: Colors.black,
                        blurRadius: 5
                      )
                    ]
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}