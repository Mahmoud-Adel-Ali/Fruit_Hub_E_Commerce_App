import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_search_field.dart';
import 'best_selling_grid_view.dart';
import 'best_selling_header.dart';
import 'featured_fruit_items.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          spacing: 12,
          children: const [
            SizedBox(height: kTopPadding),
            CustomSearchField(),
            SizedBox(height: 12),
            FeaturedFruitItems(),
            SizedBox(height: 12),
            BestSellingHeader(),
            SizedBox(height: 8),
            BestSellingGridView(),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
