import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:trivia/pages/AuthPages/sign_in_page.dart';
import 'package:trivia/pages/AuthPages/sign_up_page.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/custom_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover)),
          ),
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background-circle.png'),
                    fit: BoxFit.cover)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Logo
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(alignment: Alignment.center, children: const [
                    CircleAvatar(
                      backgroundColor: AppColors.lightBlueColor,
                      radius: 95,
                    ),
                    Image(
                      image: AssetImage('assets/images/logo-text.png'),
                      width: 900,
                    )
                  ]),
                ],
              ),
              const SizedBox(height: 40),
              // Sign In and Sign Up Buttons
              CustomButton(
                width: 180,
                height: 50,
                backgroundColor: AppColors.lightOrangeColor,
                shadowColor: AppColors.darkOrangeColor,
                labelText: 'INICIAR SESIÓN',
                fontSize: 12,
                onTap: () {
                  // Navigate to SignInPage
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: const SignInPage(),
                  );
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                width: 180,
                height: 50,
                backgroundColor: AppColors.lightGreenColor,
                shadowColor: AppColors.darkGreenColor,
                labelText: 'REGISTRARSE',
                fontSize: 12,
                onTap: () {
                  // Navigate to SignUpPage
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: SignUpPage(),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
