import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:trivia/pages/LevelsPage/LevelDetailsPage/level_details_page.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/small_text.dart';

class LevelsPage extends StatefulWidget {


  const LevelsPage({super.key});

  @override
  State<LevelsPage> createState() => _LevelsPageState();
}

class _LevelsPageState extends State<LevelsPage> {
  // Levels
  final List<Map<String, dynamic>> _levelList = [
    { 'level': 'NIVEL 1', 'numberOfChest': '500', 'image': 'assets/images/trophy-icon.png', 'isExpanded': false},
    { 'level': 'NIVEL 2', 'numberOfChest': '1000', 'image': 'assets/images/star-icon.png','isExpanded': false},
    { 'level': 'NIVEL 3', 'numberOfChest': '1500', 'image': 'assets/images/thunder-icon.png', 'isExpanded': false},
    { 'level': 'NIVEL 4', 'numberOfChest': '2000', 'image': 'assets/images/iron-icon.png', 'isExpanded': false},
    { 'level': 'NIVEL 5', 'numberOfChest': '2500', 'image': 'assets/images/chest-02-icon.png', 'wildcardImage': 'assets/images/parrot-icon.png', 'isExpanded': false},
    { 'level': 'NIVEL 6', 'numberOfChest': '3000', 'image': 'assets/images/crown-icon.png', 'wildcardImage': 'assets/images/thor-icon.png', 'isExpanded': false},
    { 'level': 'NIVEL 7', 'numberOfChest': '3500', 'image': 'assets/images/sword-icon.png', 'wildcardImage': 'assets/images/third-eye-icon.png', 'isExpanded': false},
    { 'level': 'NIVEL 8', 'numberOfChest': '4000', 'image': 'assets/images/key-icon.png', 'wildcardImage': 'assets/images/parrot-02-icon.png', 'isExpanded': false},
    { 'level': 'NIVEL 9', 'numberOfChest': '4500', 'image': 'assets/images/trophy-icon.png', 'wildcardImage': 'assets/images/parrot-03-icon.png', 'isExpanded': false},
    { 'level': 'NIVEL 10', 'numberOfChest': '5000', 'image': 'assets/images/flag-icon.png', 'wildcardImage': 'assets/images/diamond-icon.png', 'isExpanded': false},
  ];

  // Colors
  final List<Color> lightColors = [
    AppColors.lightGreenColor,
    AppColors.lightBlueColor,
    AppColors.lightOrangeColor,
  ];

  final List<Color> darkColors = [
    AppColors.darkGreenColor,
    const Color(0xFF4E75A4),
    AppColors.darkOrangeColor,
  ];

  // Items to show
  int _numItemsToShow = 4;

  // Handle scroll
  final ScrollController _scrollController = ScrollController();

  // Handle arrow down button
  void _handleTap() {
    setState(() {
      _numItemsToShow += 4;
    });
    final double newPosition = _scrollController.position.pixels + 700; 
    _scrollController.animateTo(
      newPosition, 
      duration: const Duration(milliseconds: 500), 
      curve: Curves.easeInOut
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          slivers: [
            // AppBar
            SliverAppBar(
              centerTitle: true,
              elevation: 0,
              pinned: true,
              backgroundColor: AppColors.lightBlueColor,
              title: const SmallText(
                text: 'NIVELES',
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
            // Books List
            SliverPadding(
              padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: _levelList.length,
                    (BuildContext context, int index) {
                      if(index >= _numItemsToShow) {
                        return Container();
                      }

                      final levelItem = _levelList[index];

                      return GestureDetector(
                        onTap: (){
                          // Navigate to LevelDetailsPage
                          PersistentNavBarNavigator.pushNewScreen(
                            context, 
                            screen: const LevelDetailsPage(),
                          );
                        },
                        child: _levelCard(
                          index: index,
                          levelItem: levelItem
                        )
                      );
                    }
                  ),
                ),
            ),
          ],
        )
      ),
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: SizedBox(
        height: kBottomNavigationBarHeight,
        child: IconButton(
          splashRadius: 25,
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.whiteColor,
            size: 40,
          ),
          onPressed: (){
            _handleTap();
          },
        ),
      ),
    );
  }

  // Level Card
  Widget _levelCard({
    required int index, 
    required Map<String, dynamic> levelItem
    }) {

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 336,
      height: levelItem['isExpanded'] ? 170 : 150,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: darkColors[index % darkColors.length],
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 15, bottom: 10, left: 20),
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: lightColors[index % lightColors.length],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0,4),
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                    )
                  ]
                ),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage(levelItem['image']!),
                      width: 70,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SmallText(
                          text: levelItem['level']!,
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          shadowColor: Colors.black,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Image(
                              image: AssetImage('assets/images/chest-icon.png'),
                              width: 50,
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 70,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: Center(
                                child: SmallText(
                                  text: levelItem['numberOfChest']!,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  shadowColor: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              child: levelItem['wildcardImage'] != null ? 
                              Image(
                                image: AssetImage(levelItem['wildcardImage']!),
                                width: 45,
                              ): Container(),
                            ),
                          ],
                        ),
                        const Spacer(),
                        // Expanded container
                        levelItem['isExpanded'] ? Container():
                          SizedBox(
                            width: 195,
                            height: 25,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      levelItem['isExpanded'] = true;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: AppColors.whiteColor,
                                    size: 30,
                                  ),
                                )
                              ],
                            ),
                          )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          // Dropdown section
          levelItem['isExpanded'] ? Row(
            children: [
              const SizedBox(width: 30),
              // Text
              const SmallText(
                text: '1000 PUNTOS PARA ASCENDER',
                fontSize: 10,
              ),
              const Spacer(),
              // Arrow up
              Container(
                margin: const EdgeInsets.only(right: 5),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      levelItem['isExpanded'] = false;
                    });
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_up,
                    color: AppColors.whiteColor,
                    size: 30,
                  ),
                ),
              )
            ],
          ): Container()
        ],
      ),
    );
  }
}