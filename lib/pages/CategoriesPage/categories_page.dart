import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/custom_button.dart';
import 'package:trivia/widgets/points_and_coins.dart';
import 'package:trivia/widgets/small_text.dart';

import '../../controllers/daily_bonus_controller.dart';
import '../DailyBonusPage/daily_bonus_question.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final List<Map<String, String>> _categoryList = [
    {'image': 'assets/images/art-icon.png', 'categoryName': 'Arte'},
    {'image': 'assets/images/astronomy-icon.png', 'categoryName': 'Astronomía'},
    {'image': 'assets/images/science-icon.png', 'categoryName': 'Ciencia'},
    {
      'image': 'assets/images/general-culture-icon.png',
      'categoryName': 'Cultura general'
    },
    {
      'image': 'assets/images/conspiracies-icon.png',
      'categoryName': 'Conspiraciones'
    },
    {
      'image': 'assets/images/sports-icon.png',
      'categoryName': 'Deportes generales'
    },
    {
      'image': 'assets/images/spirituality-icon.png',
      'categoryName': 'Espiritualidad'
    },
    {'image': 'assets/images/soccer-icon.png', 'categoryName': 'Fútbol'},
    {
      'image': 'assets/images/finance-icon.png',
      'categoryName': 'Finanzas e inversiones'
    },
    {'image': 'assets/images/geography-icon.png', 'categoryName': 'Geografía'},
    {
      'image': 'assets/images/hidden-history-icon.png',
      'categoryName': 'Historia Oculta'
    },
    {
      'image': 'assets/images/mysteries-icon.png',
      'categoryName': 'Misterios y enigmas'
    },
    {'image': 'assets/images/religion-icon.png', 'categoryName': 'Bíblicas'},
  ];

  int _currentPage = 1;
  final int _totalPages = 2;
  final int _itemsPerPage = 7;

  void _previousPage() {
    setState(() {
      _currentPage--;
    });
  }

  void _nextPage() {
    setState(() {
      _currentPage++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppColors.lightBlueColor,
          title: const SmallText(
            text: 'CATEGORÍAS',
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
              Get.back();
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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: Column(
                children: [
                  // Arrow icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        type: MaterialType.transparency,
                        child: InkResponse(
                          splashColor: Colors.grey.withOpacity(0.5),
                          highlightColor: Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                          radius: 30,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: IconButton(
                                onPressed:
                                    _currentPage > 1 ? _previousPage : null,
                                icon: const Icon(Icons.arrow_back_ios,
                                    color: Colors.white, size: 35)),
                          ),
                        ),
                      ),
                      Material(
                        type: MaterialType.transparency,
                        child: InkResponse(
                          splashColor: Colors.grey.withOpacity(0.5),
                          highlightColor: Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                          radius: 30,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: IconButton(
                                onPressed: _currentPage < _totalPages
                                    ? _nextPage
                                    : null,
                                icon: const Icon(Icons.arrow_forward_ios,
                                    color: Colors.white, size: 35)),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  // Category list
                  SizedBox(
                    height: 450,
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const Divider(
                          color: Colors.transparent,
                          thickness: 1,
                        );
                      },
                      itemCount: (_currentPage == 1
                          ? _itemsPerPage
                          : _categoryList.length - _itemsPerPage),
                      itemBuilder: (BuildContext context, int index) {
                        if (_currentPage == 1 && index > 7) {
                          return Container();
                        } else {
                          final itemIndex = (_currentPage == 1
                              ? index
                              : index + _itemsPerPage);
                          return CustomButton(
                              width: double.infinity,
                              height: 46,
                              backgroundColor: AppColors.lightOrangeColor,
                              shadowColor: AppColors.darkOrangeColor,
                              labelText: _categoryList[itemIndex]
                                  ['categoryName']!,
                              iconImage: AssetImage(
                                  _categoryList[itemIndex]['image']!),
                              iconSize: 30,
                              fontSize: 15,
                              onTap: () {
                                // TODO: Implement action
                                final categoryNames = _categoryList
                                    .map((category) => category['categoryName'])
                                    .toList();
                                debugPrint("categorias $categoryNames");
                                final categoryName =
                                    _categoryList[itemIndex]['categoryName']!;
                                _handleCategoryAction(categoryName);
                              });
                        }
                      },
                    ),
                  ),
                  const Spacer(),
                  // PointsAndCoins
                  const PointsAndCoins()
                ],
              ),
            )));
  }

  void _handleCategoryAction(String categoryName) {
    final dailyBonusController = Get.find<DailyBonusController>();
    dailyBonusController.loadQuestions(categoryName);
    dailyBonusController.changeAppBarTitle(categoryName);
    Get.back();
    PersistentNavBarNavigator.pushNewScreen(context,
        screen: const DailyBonusQuestion(),
        pageTransitionAnimation: PageTransitionAnimation.slideUp);
  }
}
