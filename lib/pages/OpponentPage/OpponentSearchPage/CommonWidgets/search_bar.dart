import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trivia/utils/theme.dart';

class CustomSearchBar extends StatelessWidget {

  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  final bool isObscure;

  const CustomSearchBar({
    super.key,
    required this.textController,
    required this.hintText,
    required this.icon,
    this.isObscure = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 4),
            color: AppColors.darkBlueColor
          )
      ]),
      child: TextField(
        style: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Color(0xFF27436B)
          )
        ),
        obscureText: isObscure ? true : false,
        controller: textController,
        decoration: InputDecoration(
          // hinText
          hintText: hintText,
          hintStyle: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              fontSize: 12, 
              color: Color(0xFF27436B),
              fontWeight: FontWeight.w700,
            )
          ),
          // suffixIcon
          suffixIcon: Icon(
            icon,
            color: const Color(0xFF27436B),
          ),
          // Focused Border
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(width: 1.0, color: AppColors.whiteColor)),
          // Enabled Border
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(width: 1.0, color: AppColors.whiteColor)),
          // Border
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ), // Border
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
        ),
      ),
    );
  }
}