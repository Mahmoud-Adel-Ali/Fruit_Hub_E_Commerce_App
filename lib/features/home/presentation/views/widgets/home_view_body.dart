import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_search_field.dart';
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
          children: [
            SizedBox(height: kTopPadding),
            CustomSearchField(),
            const SizedBox(height: 12),
            FeaturedFruitItems(),
            const SizedBox(height: 12),
            BestSellingHeader(),
          ],
        ),
      ),
    );
  }
}
