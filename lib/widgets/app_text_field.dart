import 'package:flutter/material.dart';
import 'package:trivia/utils/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  final bool isObscure;

  const AppTextField({
    Key? key,
    required this.textController,
    required this.hintText,
    required this.icon,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        color: AppColors.lightBlueColor,
        borderRadius: BorderRadius.circular(15), // Corregido aquí
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 4),
            color: AppColors.darkBlueColor,
          ),
        ],
      ),
      child: TextField(
        style: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteColor,
          ),
        ),
        obscureText: isObscure,
        controller: textController,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              fontSize: 12,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          prefixIcon: Icon(
            icon,
            color: AppColors.whiteColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20), // Corregido aquí
            borderSide:
                const BorderSide(width: 1.0, color: AppColors.lightBlueColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20), // Corregido aquí
            borderSide:
                const BorderSide(width: 1.0, color: AppColors.lightBlueColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20), // Corregido aquí
          ),
        ),
      ),
    );
  }
}
