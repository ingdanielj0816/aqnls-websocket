import 'package:flutter/material.dart';
import 'package:trivia/pages/HomePage/ShopPage/ShopWildcardPage/CommonWidgets/shop_wildcard_item.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/points_and_coins.dart';
import 'package:trivia/widgets/small_text.dart';

class ShopWildcardPage extends StatelessWidget {

  final List<Map<String, String>> _imagesAndQuantities = [
    { 'image': 'assets/images/parrot-icon.png', 'quantity': '100', },
    { 'image': 'assets/images/thor-icon.png', 'quantity': '200', },
    { 'image': 'assets/images/hourglass-icon.png', 'quantity': '300', },
    { 'image': 'assets/images/third-eye-icon.png', 'quantity': '400', },
    { 'image': 'assets/images/smile-wildcard-icon.png', 'quantity': '5000', },
  ];

  ShopWildcardPage({super.key});

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
          physics: const ClampingScrollPhysics(),
          slivers: [
            // AppBar
            SliverAppBar(
              centerTitle: true,
              elevation: 0,
              pinned: true,
              backgroundColor: AppColors.lightBlueColor,
              title: const SmallText(
                text: 'COMODINES',
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
            // Wildcard Grid List
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              sliver: SliverGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 40,
                crossAxisSpacing: 10,
                children: List.generate(
                  _imagesAndQuantities.length,
                  (index) => ShopWildcardItem(
                    image: _imagesAndQuantities[index]['image']!, 
                    quantity: _imagesAndQuantities[index]['quantity']!,
                  )
                ),
              ),
            ),
            // ADS Wildcard
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    ShopWildcardItem(
                      image: 'assets/images/wildcard-ads-icon.png',
                      quantity: '1.5 USD',
                      firstColor: AppColors.darkGreenColor,
                      secondColor: AppColors.lightGreenColor,
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ),
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: const PointsAndCoins(),
    );
  }
}