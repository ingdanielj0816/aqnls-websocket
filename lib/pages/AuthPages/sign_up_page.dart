import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/app_text_field.dart';
import 'package:trivia/widgets/custom_app_bar.dart';
import 'package:trivia/widgets/custom_button.dart';

import '../../api/api_client.dart';
import '../../utils/app_constants.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Input controllers
    var emailController = TextEditingController();
    var userController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            // width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                color: Colors.grey,
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
                    height: 300,
                    child: Column(
                      children: [
                        // User
                        AppTextField(
                          textController: userController,
                          hintText:
                              userController.text.isEmpty ? 'Usuario' : '',
                          icon: Icons.person,
                        ),
                        const SizedBox(height: 20),
                        // Email
                        AppTextField(
                          textController: emailController,
                          hintText: emailController.text.isEmpty ? 'Email' : '',
                          icon: Icons.email,
                        ),
                        const SizedBox(height: 20),
                        // Password
                        AppTextField(
                          textController: passwordController,
                          hintText: passwordController.text.isEmpty
                              ? 'Contraseña'
                              : '',
                          icon: Icons.lock,
                          isObscure: true,
                        ),
                        const SizedBox(height: 20),
                        // Sign Up button
                        CustomButton(
                          width: 180,
                          height: 50,
                          backgroundColor: AppColors.lightGreenColor,
                          shadowColor: AppColors.darkGreenColor,
                          labelText: 'REGISTRATE',
                          fontSize: 12,
                          onTap: () async {
                            if (userController.text.isNotEmpty &&
                                emailController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty) {
                              String userId = await registerUser(
                                  userController.text,
                                  emailController.text,
                                  passwordController.text,
                                  0,
                                  0);
                              if (userId != "-1") {
                                changeUserRole(userId, 'Player');
                              } else {
                                debugPrint("mal registro");
                              }
                            } else {
                              _showSnackbar();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Terms and conditions
                  Text(
                      'Al registrarte, aceptas nuestros Términos de Servicio y Políticas de Privacidad',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                        color: AppColors.whiteColor,
                      ))),
                ],
              ),
            ),
          ),
        ));
  }

  final _apiClient = ApiClient();
  // Función para el registro de usuarios
  Future<String> registerUser(String username, String email, String password,
      int coins, int correctquestions) async {
    try {
      final userData = {
        "username": username,
        "email": email,
        "password": password,
        "coins": coins,
        "correctquestions": correctquestions
      };

      final response = await _apiClient.postData(
        AppConstants.baseURL, // Reemplaza con la URL base
        AppConstants.UserRegister, // Reemplaza con la ruta de registro
        userData, // Cuerpo de la solicitud
        files: false, // Omitir manejo de archivos adjuntos
      );

      if (response.statusCode == 200) {
        // Registro exitoso; obtén el ID del usuario de la respuesta.
        final responseBody = jsonDecode(response.body);
        final userId = responseBody['id'];
        return userId;
      } else {
        // Manejo de errores...
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
      'CAMPOS VACIOS',
      'Rellena todos los campos antes de continuar',
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
