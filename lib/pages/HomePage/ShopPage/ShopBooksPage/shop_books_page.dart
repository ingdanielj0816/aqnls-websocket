import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:trivia/pages/HomePage/ShopPage/ShopBooksPage/CommonWidgets/book_item.dart';
import 'package:trivia/utils/theme.dart';
import 'package:trivia/widgets/points_and_coins.dart';
import 'package:trivia/widgets/small_text.dart';

class ShopBooksPage extends StatefulWidget {

  const ShopBooksPage({super.key});

  @override
  State<ShopBooksPage> createState() => _ShopBooksPageState();
}

class _ShopBooksPageState extends State<ShopBooksPage> {
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
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.lightBlueColor,
              leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                ),
              ),
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: const SmallText(
                  text: 'LIBROS',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  shadowColor: Colors.black,
                ),
                centerTitle: true,
                expandedTitleScale: 1.3,
                collapseMode: CollapseMode.parallax,
                background: Image(
                  image: const AssetImage('assets/images/bg-books.jpg'),
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if(loadingProgress != null) return const SizedBox();
                    return child; 
                  },
                )
              ),
            ),

            // Header
            const SliverPinnedHeader(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                child: Center(
                  child: SmallText(
                    text: 'Mejora tu jugabilidad y gana oro con nuestros libros',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),

            // Books List
            SliverClip(
              clipOverlap: true,
              child: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 10,
                    (BuildContext context, int index) {
                      return const BookItem();
                    }
                  ),
                ),
            ),          
          ],
        )
      ),
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: const PointsAndCoins(),
    );
  }
}
