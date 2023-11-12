import 'package:flutter/material.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/custom_button.dart';
import 'package:trivia/widgets/small_text.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  final double _progressValue = 0.55;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.lightBlueColor,
        title: const SmallText(
          text: 'CONFIGURACIÓN',
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
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              Column(
                children: [
                  // Gamer info
                  Column(
                    children: const [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/default-avatar.png'),
                      ),
                      SizedBox(height: 5),
                      SmallText(
                        text: 'Gamer',
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                      SizedBox(height: 5),
                      SmallText(
                        text: 'info@gmail.com',
                        fontSize: 13,
                      )
                    ],
                  ),
                  // Gamer level
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      const SmallText(
                        text: 'NIVEL 1',
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        shadowColor: AppColors.darkOrangeColor,
                      ),
                      const SizedBox(height: 20),
                      Stack(
                        children: [
                          SizedBox(
                            width: 310,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: const LinearProgressIndicator(
                                value: 0.5,
                                minHeight: 25,
                                backgroundColor: AppColors.whiteColor,
                                valueColor: AlwaysStoppedAnimation<Color>(AppColors.lightGreenColor),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 2,
                            left: 144,
                            child: SmallText(
                              text: '${(_progressValue * 100).toStringAsFixed(0)}%',
                              shadowColor: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 5),
                      const SmallText(
                        text: 'Progreso',
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      )
                    ],
                  ),
                  // Gamer performance
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      const SmallText(
                        text: 'DESEMPEÑO',
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        shadowColor: AppColors.darkOrangeColor,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 340,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Games won
                            Container(
                              width: 80,
                              height: 60,
                              decoration: BoxDecoration(
                                color: AppColors.lightBlueColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 4),
                                    color: AppColors.darkBlueColor,
                                  )
                                ]
                              ),
                              child: Column(
                                children: const [
                                  SmallText(
                                    text: '2',
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                  ),
                                   SmallText(
                                    text: 'Ganadas',
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  )
                                ],
                              ),
                            ),
                            // Lost games
                            Container(
                              width: 80,
                              height: 60,
                              decoration: BoxDecoration(
                                color: AppColors.lightBlueColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 4),
                                    color: AppColors.darkBlueColor,
                                  )
                                ]
                              ),
                              child: Column(
                                children: const [
                                  SmallText(
                                    text: '0',
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                  ),
                                   SmallText(
                                    text: 'Perdidas',
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  )
                                ],
                              ),
                            ),
                            // Resigns
                            Container(
                              width: 80,
                              height: 60,
                              decoration: BoxDecoration(
                                color: AppColors.lightBlueColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 4),
                                    color: AppColors.darkBlueColor,
                                  )
                                ]
                              ),
                              child: Column(
                                children: const [
                                  SmallText(
                                    text: '0',
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                  ),
                                   SmallText(
                                    text: 'Renuncias',
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                   const SizedBox(height: 30),
                  // Game options
                  Column(
                    children: [
                      const SmallText(
                        text: 'OPCIONES DEL JUEGO',
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        shadowColor: AppColors.darkOrangeColor,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 300,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButton(
                                  width: 120, 
                                  height: 28, 
                                  backgroundColor: AppColors.lightBlueColor, 
                                  shadowColor: AppColors.darkBlueColor, 
                                  labelText: 'MÚSICA',
                                  fontSize: 8,
                                  iconMaterial: Icons.music_note,
                                  onTap: (){}
                                ),
                                CustomButton(
                                  width: 120, 
                                  height: 28, 
                                  backgroundColor: AppColors.lightBlueColor, 
                                  shadowColor: AppColors.darkBlueColor, 
                                  labelText: 'AUDIO',
                                  fontSize: 8,
                                  iconMaterial: Icons.volume_up,
                                  onTap: (){}
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButton(
                                  width: 120, 
                                  height: 28, 
                                  backgroundColor: AppColors.lightBlueColor, 
                                  shadowColor: AppColors.darkBlueColor, 
                                  labelText: 'IDIOMA',
                                  fontSize: 8,
                                  iconImage: const AssetImage('assets/images/spain-icon.png'),
                                  onTap: (){}
                                ),
                                CustomButton(
                                  width: 120, 
                                  height: 28, 
                                  backgroundColor: AppColors.lightBlueColor, 
                                  shadowColor: AppColors.darkBlueColor, 
                                  labelText: 'NOTIFICACIÓN',
                                  fontSize: 8,
                                  iconMaterial: Icons.notifications_active,
                                  onTap: (){}
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  // Premium version
                  Column(
                    children: [
                       const SmallText(
                        text: 'VERSIÓN PREMIUM',
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        shadowColor: AppColors.darkOrangeColor,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: 180,
                        height: 80,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 1),
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                            )
                          ]
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                  color: AppColors.darkGreenColor,
                                ),
                                child: const Center(
                                  child: SmallText(
                                    text: 'Elimina los anuncios',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                  color: AppColors.lightGreenColor
                                ),
                                child: const Center(
                                  child: SmallText(
                                    text: 'USD 1,5',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        )
    ));
  }
}