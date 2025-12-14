import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_search_field.dart';
import 'products_section.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            SizedBox(height: kTopPadding),
            CustomSearchField(),
            SizedBox(height: 12),
            ProductsSection(),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
