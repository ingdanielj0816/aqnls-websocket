import 'package:flutter/material.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/small_text.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.only(bottom: 30, left: 40, right: 40),
      color: Colors.transparent,
      child: Column(
        children: [
          ListTile(
            splashColor: AppColors.whiteColor,
            contentPadding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            tileColor: AppColors.lightGreenColor,
            leading: const Image(
              image: AssetImage('assets/images/bible-book.png'),
            ),
            title: const SmallText(
              text: 'Los secretos de la biblia',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1C7528),
            ),
            subtitle: const SmallText(
              text: 'Libro para mejorar en temática historia oculta y conspiraciones',
              color: Color(0xFF1C7528),
            ),
            onTap: () {
              // TODO: Implement action
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SmallText(
                  text: 'OBTIENES',
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  shadowColor: AppColors.lightOrangeColor,
                ),
                SizedBox(width: 10),
                Image(
                  image: AssetImage('assets/images/coins-02.png'),
                  width: 50,
                ),
                SizedBox(width: 10),
                SmallText(
                  text: '900',
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  shadowColor: Colors.black
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}