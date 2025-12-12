import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_search_field.dart';
import '../../../../best_selling_fruits/presentation/views/widgets/best_selling_grid_view_bloc_builder.dart';
import '../../../../best_selling_fruits/presentation/views/widgets/best_selling_header.dart';
import 'featured_fruit_items.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
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
            BestSellingGridViewBlocBuilder(),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
