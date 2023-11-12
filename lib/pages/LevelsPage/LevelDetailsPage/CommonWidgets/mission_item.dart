import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/small_text.dart';

class MissionItem extends StatelessWidget {

  final int index;
  
  const MissionItem({
    super.key, 
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: index < 2 ? AppColors.lightGreenColor : AppColors.darkBlueColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: ListTile(
        dense: true,
        leading: Image(
          image: index < 2 ? const AssetImage('assets/images/gold-icon.png') : const AssetImage('assets/images/silver-icon.png'),
          width: 35,
        ),
        title: SmallText(
          text: 'Completa 5 preguntas',
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: index < 2 ? const Color(0xFF1C7528) : const Color(0xFFFFFFFF),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Stack(
            children: [
              SizedBox(
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: 0.4,
                    minHeight: 15,
                    backgroundColor: index < 2 ? const Color(0xFF80AB00) : const Color(0xFF557193),
                    valueColor: index < 2 ? const AlwaysStoppedAnimation<Color>(AppColors.yellowColor) : const AlwaysStoppedAnimation<Color>(AppColors.lightBlueColor),
                  ),
                ),
              ),
               Positioned(
                left: 90,
                 child: Text(
                  '2/5',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                    )
                  )
                             ),
               ),
            ],
          )
        ),
        onTap: () {
          // Lógica para manejar el evento onTap
        },
      ),
    );
  }
}