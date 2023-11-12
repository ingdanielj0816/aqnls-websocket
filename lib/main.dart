import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trivia/helper/dependencies.dart';
import 'package:trivia/pages/SplashPage/splash_page.dart';


void main() {
  configure();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '¿A que no lo sabias?',
      home: SplashPage(),
    );
  }
}
