import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:trivia/pages/LevelsPage/LevelDetailsPage/CommonWidgets/level_progress.dart';
import 'package:trivia/pages/LevelsPage/LevelDetailsPage/CommonWidgets/mission_item.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/small_text.dart';

class LevelDetailsPage extends StatelessWidget {
  const LevelDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                text: 'NIVEL 1',
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

            // Level Progress
            const SliverPinnedHeader(
              child: Padding(
                padding: EdgeInsets.only(top: 30, bottom: 20, left: 40, right: 40),
                child: LevelProgress(),
              ),
            ),

            // Mission list
            SliverClip(
              clipOverlap: true,
              child: SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 12,
                    (BuildContext context, int index) {
                      return MissionItem(
                        index: index
                      );
                    }
                  ),
                )
              ),
            ),
          ],
        )
      )
    );
  }
}