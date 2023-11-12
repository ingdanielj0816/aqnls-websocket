import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'package:trivia/utils/theme.dart';
import 'package:trivia/pages/HomePage/RankingPage/avatar_with_star.dart';
import 'package:trivia/pages/HomePage/RankingPage/ranking_items.dart';
import 'package:trivia/widgets/custom_button.dart';
import 'package:trivia/widgets/small_text.dart';

class TimeRankingPage extends StatefulWidget {
  const TimeRankingPage({super.key});

  @override
  State<TimeRankingPage> createState() => _TimeRankingPageState();
}

class _TimeRankingPageState extends State<TimeRankingPage> {

  int selectedButton = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
          slivers: [
            // AppBar
            SliverAppBar(
              centerTitle: true,
              elevation: 0,
              pinned: true,
              backgroundColor: AppColors.lightBlueColor,
              title: const SmallText(
                text: 'RANKING TIEMPOS',
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

            // Avatar
            SliverPinnedHeader(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    // Avatar
                    const AvatarWithStar(
                      level: 'LV4',
                    ),
                    const SizedBox(height: 20),
                    // Buttons
                    SizedBox(
                      // width: 230,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButton(
                            width: 85, 
                            height: 20, 
                            backgroundColor: selectedButton == 1 ? AppColors.lightOrangeColor : AppColors.darkBlueColor,
                            shadowColor:  selectedButton == 1 ? AppColors.darkOrangeColor : AppColors.darkBlueColor,
                            labelText: 'SEMANA', 
                            fontSize: 8,
                            onTap: (){
                              if(selectedButton != 1) {
                                setState(() {
                                  selectedButton = 1;
                                });
                              }
                            }
                          ),
                          CustomButton(
                            width: 85, 
                            height: 20, 
                           backgroundColor: selectedButton == 2 ? AppColors.lightOrangeColor : AppColors.darkBlueColor,
                            shadowColor:  selectedButton == 2 ? AppColors.darkOrangeColor : AppColors.darkBlueColor,
                            labelText: 'PODIO', 
                            fontSize: 8,
                            onTap: (){
                              if(selectedButton != 2) {
                                setState(() {
                                  selectedButton = 2;
                                });
                              }
                            }
                          ),
                          CustomButton(
                            width: 85, 
                            height: 20, 
                            backgroundColor: selectedButton == 3 ? AppColors.lightOrangeColor : AppColors.darkBlueColor,
                            shadowColor:  selectedButton == 3 ? AppColors.darkOrangeColor : AppColors.darkBlueColor,
                            labelText: 'SIEMPRE', 
                            fontSize: 8,
                            onTap: (){
                              if(selectedButton != 3) {
                                setState(() {
                                  selectedButton = 3;
                                });
                              }
                            }
                          ),
                          CustomButton(
                            width: 110, 
                            height: 20, 
                            backgroundColor: selectedButton == 4 ? AppColors.lightOrangeColor : AppColors.darkBlueColor,
                            shadowColor:  selectedButton == 4 ? AppColors.darkOrangeColor : AppColors.darkBlueColor,
                            labelText: 'CONTRARRELOJ', 
                            fontSize: 8,
                            onTap: (){
                              if(selectedButton != 4) {
                                setState(() {
                                  selectedButton = 4;
                                });
                              }
                            }
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20)
                  ],
                )
              ),
            ),

            // Ranking List
            SliverStack(
              insetOnOverlap: true,
              children: [
                SliverPositioned.fill(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBEBEB),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 8,
                          color: Colors.black26,
                        )
                      ],
                    ),
                  ),
                ),
                SliverClip(
                  clipOverlap: true,
                  child: SliverPadding(
                    padding: const EdgeInsets.all(20),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: 15,
                        (BuildContext context, int index) {
                          return const RankingItems();
                        }
                      ),
                    )
                  ),
                ),
              ],
            ),
          ],
        )
      ),
      bottomNavigationBar: const SizedBox(height: 8),
    );
  }
}