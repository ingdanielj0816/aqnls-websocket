import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:trivia/pages/HomePage/ShopPage/ShopBooksPage/shop_books_page.dart';
import 'package:trivia/pages/HomePage/ShopPage/ShopWildcardPage/shop_wildcard_page.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/custom_button.dart';
import 'package:trivia/widgets/small_text.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.lightBlueColor,
        title: const SmallText(
          text: 'TIENDA',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          shadowColor: Colors.black,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50, right: 45, left: 45),
          child: Column(
            children: [
              SizedBox(
                height: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                      width: double.infinity, 
                      height: 47, 
                      backgroundColor: AppColors.lightOrangeColor, 
                      shadowColor: AppColors.darkOrangeColor, 
                      labelText: 'LIBROS', 
                      fontSize: 18,
                      onTap: (){
                        // Navigate to ShopBooksPage
                        PersistentNavBarNavigator.pushNewScreen(
                          context, 
                          screen: const ShopBooksPage(),
                        );
                      }
                    ),
                    CustomButton(
                      width: double.infinity, 
                      height: 47, 
                      backgroundColor: AppColors.lightGreenColor, 
                      shadowColor: AppColors.darkGreenColor, 
                      labelText: 'COMODINES', 
                      fontSize: 18,
                      onTap: (){
                        // Navigate to ShopWildcardPage
                        PersistentNavBarNavigator.pushNewScreen(
                          context, 
                          screen: ShopWildcardPage(),
                        );
                      }
                    )
                  ],
                ),
              )
            ],
          ),
        )
    ));
  }
}