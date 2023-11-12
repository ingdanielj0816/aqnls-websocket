import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:animate_do/animate_do.dart';

import 'package:trivia/pages/HomePage/home_page.dart';

import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/app_text_field.dart';
import 'package:trivia/widgets/custom_app_bar.dart';
import 'package:trivia/widgets/custom_button.dart';
import 'package:trivia/widgets/shake_button.dart';
import 'package:trivia/widgets/small_text.dart';

import '../../api/api_client.dart';
import '../../utils/app_constants.dart';
import 'login_facebook.dart';
import 'login_google.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    // Input controllers
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 40, bottom: 40, right: 30, left: 30),
              child: Column(
                children: [
                  // CustomAppBar
                  CustomAppBar(
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  // App logo
                  Spin(
                    child: SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: Column(
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
                    ),
                  ),
                  const SizedBox(height: 50),
                  // Form
                  SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: Column(
                      children: [
                        // Email
                        AppTextField(
                          textController: emailController,
                          icon: Icons.person,
                          hintText: emailController.text.isEmpty ? 'Email' : '',
                        ),
                        const SizedBox(height: 20),
                        // Password
                        AppTextField(
                          textController: passwordController,
                          icon: Icons.lock,
                          hintText:
                              emailController.text.isEmpty ? 'Contraseña' : '',
                          isObscure: true,
                        ),
                        const SizedBox(height: 20),
                        // Forget your password
                        const SmallText(
                          text: '¿OLVIDASTE TU CONTRASEÑA?',
                          fontWeight: FontWeight.w700,
                        ),
                        const SizedBox(height: 20),

                        // Login button
                        ShakeButton(
                            labelText: 'INICIAR SESIÓN',
                            shakeConstant: ShakeLittleConstant2(),
                            backgroundColor: AppColors.lightGreenColor,
                            shadowColor: AppColors.darkGreenColor,
                            onTap: () async {
                              if (emailController.text.isNotEmpty &&
                                  passwordController.text.isNotEmpty) {
                                String userId = await loginUser(
                                  emailController.text,
                                  passwordController.text,
                                );
                                if (userId != "-1") {
                                  changeUserRole(userId, 'Player');
                                  //FocusScope.of(context).unfocus();
                                  PersistentNavBarNavigator.pushNewScreen(
                                    context,
                                    screen: const HomePage(),
                                  );
                                } else {
                                  debugPrint("Error");
                                }
                              } else {
                                _showSnackbar();
                              }
                            })
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Social buttons
                  SizedBox(
                    width: double.infinity,
                    height: 130,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Facebook login
                        CustomButton(
                          width: 220,
                          height: 30,
                          backgroundColor: AppColors.lightOrangeColor,
                          shadowColor: AppColors.darkOrangeColor,
                          labelText: 'CONTINUAR CON FACEBOOK',
                          fontSize: 10,
                          iconMaterial: Icons.facebook,
                          onTap: () async {
                            debugPrint("Facebook antes");
                            FacebookUserData? userData =
                                await initiateFacebookLogin();
                            debugPrint("Facebook");

                            if (userData != null) {
                              // Acceso exitoso, puedes utilizar los datos del usuario (userData)
                              debugPrint(
                                  "Nombre del usuario: ${userData.name}");
                              debugPrint(
                                  "Correo del usuario: ${userData.email}");

                              // Puedes realizar otras acciones aquí, como navegar a la próxima pantalla.
                            } else {
                              // Autenticación fallida, puedes mostrar un mensaje de error si lo deseas.
                            }
                          },
                        ),
                        // Gmail login
                        CustomButton(
                          width: 220,
                          height: 30,
                          backgroundColor: AppColors.lightGreenColor,
                          shadowColor: AppColors.darkGreenColor,
                          labelText: 'CONTINUAR CON GMAIL',
                          fontSize: 10,
                          iconImage:
                              const AssetImage('assets/images/gmail-logo.png'),
                          onTap: () async {
                            // TODO: Implement Action
                            UserData? userData = await signInWithGoogle();

                            if (userData != null) {
                              // Acceso exitoso, puedes utilizar los datos del usuario (userData)
                              print("Nombre del usuario: ${userData.name}");
                              print("Correo del usuario: ${userData.email}");

                              // Puedes realizar otras acciones aquí, como navegar a la próxima pantalla.
                            } else {
                              // Autenticación fallida, puedes mostrar un mensaje de error si lo deseas.
                            }
                          },
                        ),
                        // Apple login
                        CustomButton(
                          width: 220,
                          height: 30,
                          backgroundColor: AppColors.lightBlueColor,
                          shadowColor: AppColors.darkBlueColor,
                          labelText: 'CONTINUAR CON APPLE',
                          fontSize: 10,
                          iconMaterial: Icons.apple,
                          onTap: () {
                            // TODO: Implement Action
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  final _apiClient = ApiClient();
  Future<String> loginUser(String email, String password) async {
    try {
      final loginData = {
        "identifier": email,
        "password": password,
      };

      final response = await _apiClient.postData(
        AppConstants.baseURL, // Reemplaza con la URL base
        AppConstants.UserLogin, // Reemplaza con la ruta de inicio de sesión
        loginData, // Cuerpo de la solicitud
        files: false, // Omitir manejo de archivos adjuntos
      );

      if (response.statusCode == 200) {
        // Inicio de sesión exitoso; obtén el ID del usuario de la respuesta.
        final responseBody = jsonDecode(response.body);
        final userId = responseBody['id'];
        return userId;
      } else {
        // El inicio de sesión falló, maneja el error adecuadamente.
        // Puedes devolver un código de error, como "-1", si lo deseas.
        return "-1"; // Valor de error, puedes elegir otro valor apropiado.
      }
    } catch (e) {
      // Manejo de errores...
      return "-1"; // Valor de error, puedes elegir otro valor apropiado.
    }
  }

  void changeUserRole(String userId, String newRole) async {
    try {
      final roleData = {
        "role": newRole, // El nuevo rol que deseas asignar al usuario
      };

      await _apiClient.postData(
        AppConstants.baseURL, // Reemplaza con la URL base
        '${AppConstants.UserRegister}/$userId/roles', // Reemplaza con la ruta de registro
        roleData, // Cuerpo de la solicitud
        files: false, // Puedes ajustar esto según tus necesidades
      );
    } catch (e) {
      // Manejo de errores...
    }
  }

  void _showSnackbar() {
    Get.snackbar(
      'ERROR',
      'Contraseña y/o email incorrectos',
      icon: const Icon(Icons.help_outline, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      borderRadius: 20,
      margin: const EdgeInsets.only(
          left: 15, right: 15, bottom: kBottomNavigationBarHeight + 10),
      colorText: Colors.black,
      duration: const Duration(seconds: 8),
      isDismissible: false,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
