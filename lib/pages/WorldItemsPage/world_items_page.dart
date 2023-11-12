import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trivia/controllers/world_question_list_controller.dart';
import 'package:trivia/pages/WorldItemsPage/CommonWidgets/category_item.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/small_text.dart';

class WorldItemsPage extends StatelessWidget {
  final List<Map<String, dynamic>> _categoryList = [
    {
      'categoryName': 'Arte',
      'image': 'assets/images/world-item-art.png',
      'stars': 3
    },
    {
      'categoryName': 'Astronomía',
      'image': 'assets/images/world-item-astronomy.png',
      'stars': 0
    },
    {
      'categoryName': 'Bíblicas',
      'image': 'assets/images/world-item-bible.png',
      'stars': 0
    },
    {
      'categoryName': 'Ciencia',
      'image': 'assets/images/world-item-science.png',
      'stars': 2
    },
    {
      'categoryName': 'Conspiraciones',
      'image': 'assets/images/world-item-conspiracies.png',
      'stars': 1
    },
    {
      'categoryName': 'Cultura general',
      'image': 'assets/images/world-item-general-culture.png',
      'stars': 0
    },
    {
      'categoryName': 'Deportes generales',
      'image': 'assets/images/world-item-sports.png',
      'stars': 0
    },
    {
      'categoryName': 'Espiritualidad',
      'image': 'assets/images/world-item-spirituality.png',
      'stars': 0
    },
    {
      'categoryName': 'Finanzas e inversiones',
      'image': 'assets/images/world-item-finance.png',
      'stars': 0
    },
    {
      'categoryName': 'Fútbol',
      'image': 'assets/images/world-item-soccer.png',
      'stars': 0
    },
    {
      'categoryName': 'Geografía',
      'image': 'assets/images/world-item-geography.png',
      'stars': 0
    },
    {
      'categoryName': 'Historia Oculta',
      'image': 'assets/images/world-item-hidden-history.png',
      'stars': 0
    },
    {
      'categoryName': 'Misterios y enigmas',
      'image': 'assets/images/world-item-mistery.png',
      'stars': 0
    },
  ];

  WorldItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final WorldQuestionListController worldQuestionListController =
        Get.find<WorldQuestionListController>();

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // AppBar
                SliverAppBar(
                  centerTitle: true,
                  elevation: 0,
                  pinned: true,
                  backgroundColor: AppColors.lightBlueColor,
                  title: const SmallText(
                    text: 'AVENTURA',
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

                // Categories
                SliverPadding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                  sliver: SliverGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 40,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.75,
                    children: _categoryList.map((category) {
                      int index = _categoryList.indexOf(category);
                      return CategoryItem(
                        category: category,
                        onTap: () {
                          worldQuestionListController.setCurrentCategory(
                              _categoryList[index]['categoryName']);
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            )));
  }
}
