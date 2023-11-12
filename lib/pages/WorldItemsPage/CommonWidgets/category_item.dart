import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:trivia/widgets/small_text.dart';

class CategoryItem extends StatelessWidget {
  
  final Map<String, dynamic> category;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.category, 
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 50,
            child: Stack(
              children: [
                Positioned(
                  left: 10,
                  top: 15,
                  child: Flash(
                    infinite: category['stars'] >= 1,
                    duration: const Duration(milliseconds: 2000),
                    child: Image(
                      image: category['stars'] >= 1 ? const AssetImage('assets/images/star-icon.png', ) : const AssetImage('assets/images/star-grey-icon.png'),
                      width: 35,
                    ),
                  )
                ),
                Positioned(
                  left: 60,
                  child: Flash(
                    infinite: category['stars'] >= 2,
                    duration: const Duration(milliseconds: 2000),
                    child: Image(
                      image: category['stars'] >= 2 ? const AssetImage('assets/images/star-icon.png', ) : const AssetImage('assets/images/star-grey-icon.png'),
                      width: 35,
                    ),
                  )
                ),
                Positioned(
                  right: 10,
                  top: 15,
                  child: Flash(
                    infinite: category['stars'] >= 3,
                    duration: const Duration(milliseconds: 2000),
                    child: Image(
                      image: category['stars'] >= 3 ? const AssetImage('assets/images/star-icon.png', ) : const AssetImage('assets/images/star-grey-icon.png'),
                      width: 35,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Roulette(
            infinite: true,
            child: SizedBox(
              width: 100,
              height: 100,
              child: Image(
                image: AssetImage(category['image']),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 15),
          // Category Name
          SmallText(
            text: category['categoryName'],
            fontSize: 14,
            fontWeight: FontWeight.w800,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
