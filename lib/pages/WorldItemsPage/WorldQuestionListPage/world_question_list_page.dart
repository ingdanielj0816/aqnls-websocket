import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trivia/controllers/world_question_list_controller.dart';
import 'package:trivia/pages/WorldItemsPage/WorldQuestionListPage/CommonWidgets/question_item.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/small_text.dart';

class WorldQuestionListPage extends StatelessWidget {

  final WorldQuestionListController _worldQuestionListController = Get.find<WorldQuestionListController>();

  WorldQuestionListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_worldQuestionListController.backgroundImage.value),
            fit: BoxFit.cover,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            // AppBar
            SliverAppBar(
              centerTitle: true,
              elevation: 0,
              pinned: true,
              backgroundColor: AppColors.lightBlueColor,
              title: Obx(() {
                  return SmallText(
                    text: _worldQuestionListController.currentCategory.value,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    shadowColor: Colors.black,
                  );
                }
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

            // Gamers Grid List
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              sliver: SliverGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 40,
                crossAxisSpacing: 10,
                children: List.generate(
                  12,
                  (index) => const QuestionItem()
                ).toList(),
              ),
            ),
          ],
        )
      )
    );
  }
}

