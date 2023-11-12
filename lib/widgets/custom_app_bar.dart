import 'package:flutter/material.dart';
import 'package:trivia/utils/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  final VoidCallback onPressed;

  const CustomAppBar({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          child: InkResponse(
            onTap: onPressed,
            splashColor: Colors.grey.withOpacity(0.5),
            highlightColor: Colors.transparent,
            borderRadius: BorderRadius.circular(30),
            radius: 30,
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(
                Icons.arrow_back_ios,
                size: 35,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
