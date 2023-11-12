import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:rxdart/subjects.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:vibration/vibration.dart';

import 'package:trivia/controllers/daily_bonus_controller.dart';
import 'package:trivia/pages/DailyBonusPage/daily_bonus_question.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/small_text.dart';

import '../../controllers/home_controller.dart';

class DailyBonusPage extends StatefulWidget {
  const DailyBonusPage({super.key});

  @override
  State<DailyBonusPage> createState() => _DailyBonusPageState();
}

class _DailyBonusPageState extends State<DailyBonusPage> {
  // Selected Item
  final selected = BehaviorSubject<int>();

  // Question Category
  String questionCategory = 'GIRAR';

  bool _isPressed = false;

  bool _selectedItem = false;

  // Colors
  final List<Color> colors = [
    AppColors.lightBlueColor,
    AppColors.yellowColor,
    AppColors.darkBlueColor,
    AppColors.lightOrangeColor,
    AppColors.darkGreenColor,
  ];

  // Items
  final Map<String, String> items = {
    "Arte": "assets/images/art-icon.png",
    "Geografía": "assets/images/geography-icon.png",
    "Historia Oculta": "assets/images/hidden-history-icon.png",
    "Deportes generales": "assets/images/sports-icon.png",
    "Fútbol": "assets/images/soccer-icon.png",
    "Bíblicas": "assets/images/religion-icon.png",
    "Conspiraciones": "assets/images/conspiracies-icon.png",
    "Misterios y enigmas": "assets/images/mysteries-icon.png",
    "Espiritualidad": "assets/images/spirituality-icon.png",
    "Cultura general": "assets/images/general-culture-icon.png",
    "Ciencia": "assets/images/science-icon.png",
    "Finanzas e inversiones": "assets/images/finance-icon.png",
    "Astronomía": "assets/images/astronomy-icon.png",
  };

  late AudioPlayer _audioPlayer;

  Color _selectedColorItem = Colors.white.withOpacity(0.5);
  double _borderWidth = 1.0;

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  void _changeColor(index) {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _selectedColorItem = _selectedColorItem == Colors.white.withOpacity(0.5)
            ? colors[index % colors.length]
            : Colors.white.withOpacity(0.5);
      });
    });
    setState(() {
      _borderWidth =
          _borderWidth == 1.0 ? _borderWidth = 3.0 : _borderWidth = 1.0;
    });
  }

  @override
  void dispose() {
    selected.close();
    _audioPlayer.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Input controller
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.lightBlueColor,
        title: const SmallText(
          text: 'BONUS DIARIO',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          shadowColor: Colors.black,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Roulette
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: CircleAvatar(
                    radius: 180,
                    backgroundColor: const Color(0xFF20376D),
                    child: CircleAvatar(
                      radius: 170,
                      backgroundColor: const Color(0xFF3F72BC),
                      child: CircleAvatar(
                        radius: 156,
                        backgroundColor: const Color(0xFF0A477E),
                        child: SizedBox(
                          height: 300,
                          child: FortuneWheel(
                            duration: const Duration(seconds: 14),
                            selected: selected.stream,
                            animateFirst: false,
                            indicators: [
                              FortuneIndicator(
                                alignment: Alignment.center,
                                child: Transform.scale(
                                  scale: 0.0,
                                  child: const TriangleIndicator(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                            ],
                            items: [
                              for (int i = 0;
                                  i < items.length;
                                  i++) ...<FortuneItem>{
                                FortuneItem(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 60),
                                      child: Image.asset(
                                        items.values.elementAt(i),
                                        fit: BoxFit.contain,
                                        width: 35,
                                      ),
                                    ),
                                    style: _selectedItem && i == selected.value
                                        ? FortuneItemStyle(
                                            color: _selectedColorItem,
                                            borderColor: AppColors.whiteColor,
                                            borderWidth: _borderWidth)
                                        : FortuneItemStyle(
                                            color: colors[i % colors.length],
                                            borderColor: AppColors.whiteColor,
                                          )),
                              }
                            ],
                            onAnimationStart: () async {
                              // Play Audio
                              await _audioPlayer.play(AssetSource(
                                  'audio/wheel-spinning-effect.wav'));
                            },
                            onAnimationEnd: () async {
                              // Select Item
                              final index = selected.value;
                              setState(() {
                                questionCategory = items.keys.elementAt(index);
                              });

                              // if _selectedItem is true then changed the style.
                              setState(() {
                                _selectedItem = true;
                              });

                              _changeColor(index);

                              // Show Snackbar
                              _showSnackbar(questionCategory);

                              // Stop Audio
                              await _audioPlayer.stop();

                              // Vibration
                              Vibration.vibrate(duration: 1000);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Smile Roulette
                const Positioned(
                  top: 190,
                  left: 130,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('assets/images/smile-roulette.png'),
                  ),
                ),
                // Button: Spin Roulette
                Positioned(
                  top: 15,
                  left: 100,
                  child: Stack(
                    children: [
                      const SizedBox(
                        width: 155,
                        child: Image(
                          image: AssetImage('assets/images/indicator.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          width: 160,
                          height: 45,
                          top: 15,
                          child: Center(
                            child: SmallText(
                              text: questionCategory,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              shadowColor: AppColors.darkOrangeColor,
                              textAlign: TextAlign.center,
                            ),
                          )),
                      Positioned(
                        top: 6,
                        left: 15,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(30),
                            splashColor: Colors.white.withOpacity(0.5),
                            highlightColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                // Reset style of selectedItem
                                _selectedItem = false;

                                // Spin roulette
                                selected
                                    .add(Fortune.randomInt(0, items.length));
                              });
                            },
                            child: const SizedBox(
                              width: 125,
                              height: 65,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Show Snackbar
  void _showSnackbar(String questionCategory) {
    final dailyBonusController = Get.find<DailyBonusController>();
    Get.snackbar(
      'Pregunta sobre: $questionCategory',
      'Haz click aquí para ir a la pregunta',
      icon: const Icon(Icons.help_outline, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      borderRadius: 20,
      margin: const EdgeInsets.only(
          left: 15, right: 15, bottom: kBottomNavigationBarHeight + 10),
      colorText: Colors.white,
      duration: const Duration(seconds: 8),
      isDismissible: false,
      forwardAnimationCurve: Curves.easeOutBack,
      onTap: (snack) {
        if (!_isPressed) {
          dailyBonusController.loadQuestions(questionCategory);
          dailyBonusController.changeAppBarTitle(questionCategory);
          Get.back();
          PersistentNavBarNavigator.pushNewScreen(context,
              screen: const DailyBonusQuestion(),
              pageTransitionAnimation: PageTransitionAnimation.slideUp);
          _isPressed = true;
        }
      },
    );
  }
}
