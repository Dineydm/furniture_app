import 'package:flutter/material.dart';
import '/data/fake.dart';
import '/widgets/app_bottom_navigation.dart';

import 'widgets/furniture_grid_item.dart';
import 'widgets/header_sliver.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomNavigation(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: HeaderSliver(108.0, 108.0),
            ),
            SliverGrid.count(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              children: Fake.furniture.asMap().entries.map((f) {
                return FurnitureGridItem(
                  f.value,
                  margin: EdgeInsets.only(
                    left: f.key.isEven ? 16.0 : 0.0,
                    right: f.key.isOdd ? 16.0 : 0.0,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
