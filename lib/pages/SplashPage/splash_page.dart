import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trivia/pages/WelcomePage/welcome_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _controller;

  late AnimationController _circleController;

  @override
  void initState() {
    super.initState();

    // Animation controllers
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _controller.forward();

    _circleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _circleController.repeat();

    // Redirect
    Timer(const Duration(seconds: 5), () {
      // Navigate to WelcomePage
      Get.to(
        const WelcomePage(),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _circleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            // Fondo con gradiente
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg-splash.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Logo en el centro
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: ScaleTransition(
                scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                    parent: _controller,
                    curve: Curves.linear,
                  ),
                ),
                child: Image.asset(
                  'assets/images/logo-full.png',
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
              ),
            ),
            // Círculos alrededor del logo
            Positioned(
              top: MediaQuery.of(context).size.height * 0.5,
              bottom: MediaQuery.of(context).size.height * 0.2,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCircle(0.0),
                  const SizedBox(width: 16.0),
                  _buildCircle(0.2),
                  const SizedBox(width: 16.0),
                  _buildCircle(0.4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircle(double delay) {
    return ScaleTransition(
      scale: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _circleController,
          curve: Interval(
            delay,
            delay + 0.5,
            curve: Curves.easeInOut,
          ),
        ),
      ),
      child: Container(
        width: 12.0,
        height: 12.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
      ),
    );
  }
}
