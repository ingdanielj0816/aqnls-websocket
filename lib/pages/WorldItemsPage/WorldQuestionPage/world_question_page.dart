import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trivia/controllers/world_question_list_controller.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/custom_button.dart';
import 'package:trivia/widgets/small_text.dart';

class WorldQuestionPage extends StatefulWidget {
  const WorldQuestionPage({super.key});

  @override
  State<WorldQuestionPage> createState() => _WorldQuestionPageState();
}

class _WorldQuestionPageState extends State<WorldQuestionPage> {
final WorldQuestionListController _worldQuestionListController = Get.find<WorldQuestionListController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.lightBlueColor,
        title: Obx(() {
          return SmallText(
            text: _worldQuestionListController.currentCategory.value,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            shadowColor: Colors.black,
          );
        }),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
          ),
          onPressed: (){
            Get.back();
          },
        ),
        actions: const [
          // Timer
          Padding(
            padding: EdgeInsets.all(15.0),
            child: SmallText(
              text: '15"',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              shadowColor: Colors.black,
            ),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg-spirituality.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Question
            Container(
              width: 336,
              height: 270,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.lightGreenColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow:  [
                  BoxShadow(
                    offset: const Offset(1, 1),
                    color: AppColors.darkGreenColor.withOpacity(0.9),
                    blurRadius: 20
                  )
                ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Image(
                    image: AssetImage('assets/images/hourglass-icon-02.png'),
                    width: 65,
                  ),
                  SmallText(
                    text: '¿Cuál es el elemento químico más abundante en la corteza terrestre?',
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 78),
            // Options
            Column(
              children: [
                ...List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: CustomButton(
                      width: 336, 
                      height: 46, 
                      backgroundColor: const Color(0xFFFFFFFF), 
                      shadowColor:  const Color(0xFFBDBDBD), 
                      labelText: 'Opción $index',
                      fontSize: 18,
                      textColor: const Color(0xFF2D4C91),
                      onTap: (){
                      }
                    ),
                  ))
              ],
            ),
            const SizedBox(height: 80),
            // Previous/Next
            SizedBox(
              width: 336,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    width: 128, 
                    height: 44, 
                    backgroundColor: AppColors.lightGreenColor, 
                    shadowColor: AppColors.darkGreenColor, 
                    labelText: 'ANTERIOR',
                    onTap: (){
                    }
                  ),
                  CustomButton(
                    width: 128, 
                    height: 44, 
                    backgroundColor: AppColors.lightGreenColor, 
                    shadowColor: AppColors.darkGreenColor, 
                    labelText: 'SIGUIENTE',
                    onTap: (){
                    }
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}