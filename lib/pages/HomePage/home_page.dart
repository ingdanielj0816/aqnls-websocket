import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trivia/controllers/music_controller.dart';
import 'package:trivia/pages/HomePage/LobbyPage/lobby_page.dart';
import 'package:trivia/pages/HomePage/RankingPage/ranking_page.dart';
import 'package:trivia/pages/HomePage/SettingsPage/settings_page.dart';
import 'package:trivia/pages/HomePage/ShopPage/shop_page.dart';
import 'package:trivia/utils/theme.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late PersistentTabController _controller;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _audioPlayer = AudioPlayer();
    _playMusic();
  }

  Future<void> _playMusic() async {
    final musicBonusController = Get.find<MusicController>();

    if(musicBonusController.isPlaying.isTrue) {
      await _audioPlayer.play(AssetSource('audio/winner-song.wav'));
      _audioPlayer.setReleaseMode(ReleaseMode.loop);
      return;
    }
  }

  // Pages
  List<Widget> _buildScreens() {
    return const <Widget>[
      LobbyPage(),
      ShopPage(),
      RankingPage(),
      SettingsPage(),
    ];
  }

  // NavBar Items
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: ("Inicio"),
          activeColorPrimary: AppColors.whiteColor,
          inactiveColorPrimary: AppColors.whiteColor.withOpacity(0.5),
      ),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.storefront),
          title: ("Tienda"),
          activeColorPrimary: AppColors.whiteColor,
          inactiveColorPrimary: AppColors.whiteColor.withOpacity(0.5),
      ),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.emoji_events_outlined),
          title: ("Ranking"),
          activeColorPrimary: AppColors.whiteColor,
          inactiveColorPrimary: AppColors.whiteColor.withOpacity(0.5),
      ),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.settings_outlined),
          title: ("Configuración"),
          activeColorPrimary: AppColors.whiteColor,
          inactiveColorPrimary: AppColors.whiteColor.withOpacity(0.5),
      ),
    ];
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: AppColors.lightBlueColor, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: false, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: const NavBarDecoration(
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style12, // Choose the nav bar style with this property.
    );
  }
}