import 'package:flutter/material.dart';
import '/screens/category/category_screen.dart';
import '/widgets/app_bottom_navigation.dart';
import '/screens/home/widgets/image_card.dart';
import '/screens/home/widgets/category_card.dart';
import '/screens/home/widgets/promo_card.dart';
import '/data/fake.dart';
import '/screens/home/widgets/section.dart';
import '/screens/home/widgets/header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  onCategorySelected(category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomNavigation(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              Section(
                'Categories',
                Fake.categories.map((c) {
                  return CategoryCard(
                    c.title,
                    c.iconPath,
                    () {
                      onCategorySelected(c);
                    },
                  );
                }).toList(),
              ),
              Section(
                'Today\'s Promo',
                Fake.promotions.map((p) {
                  return PromoCard(
                    p.title!,
                    p.subtitle!,
                    p.backgroundImagePath!,
                    caption: p.caption,
                    tag: p.tag,
                    imagePath: p.imagePath,
                    reverseGradient: p.reverseGradient,
                  );
                }).toList(),
              ),
              Section(
                  'Trending Furniture',
                  Fake.trending
                      .map((imagePath) => ImageCard(imagePath))
                      .toList()),
              Section(
                  'Trending Furniture',
                  Fake.featured
                      .map((imagePath) => ImageCard(imagePath))
                      .toList()),
            ],
          ),
        ),
      ),
    );
  }
}
