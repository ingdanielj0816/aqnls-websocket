import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trivia/utils/theme.dart';

class ShopWildcardItem extends StatelessWidget {
  final String image;
  final String quantity;
  final Color firstColor;
  final Color secondColor;

  const ShopWildcardItem({
    super.key,
    required this.image,
    required this.quantity, 
    this.firstColor = AppColors.lightOrangeColor,
    this.secondColor = AppColors.darkOrangeColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 89,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: firstColor,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Image(
                image: AssetImage(image),
                width: 80,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: secondColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage('assets/images/coins-02.png'),
                      width: 25,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      quantity,
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
