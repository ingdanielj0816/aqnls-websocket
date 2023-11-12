import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:trivia/pages/OpponentPage/OpponentSearchPage/CommonWidgets/opponent_item.dart';
import 'package:trivia/pages/OpponentPage/OpponentSearchPage/CommonWidgets/search_bar.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/small_text.dart';

class OpponentSearchPage extends StatelessWidget {
  const OpponentSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Input controller
    final searchController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.height,
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
                text: 'OPONENTE',
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

            // SeachBar
            SliverPinnedHeader(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                child: CustomSearchBar(
                  textController: searchController, 
                  hintText: 'Buscar', 
                  icon: Icons.search
                ),
              ),
            ),

            // Gamers Grid List
            SliverClip(
              clipOverlap: true,
              child: SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                sliver: SliverGrid.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 40,
                  crossAxisSpacing: 10,
                  children: List.generate(
                    20,
                    (index) => OpponentItem(
                      name: 'Gamer $index', 
                      level: 'Nivel 100'
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      )
    );
  }
}
