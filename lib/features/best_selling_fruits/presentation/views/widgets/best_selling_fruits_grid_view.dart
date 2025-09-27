import 'package:flutter/material.dart';

import '../../../../../core/widgets/fruit_item.dart';

class BestSellingFruitsGridView extends StatelessWidget {
  const BestSellingFruitsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      itemCount: 15,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
        childAspectRatio: 3 / 4,
      ),
      itemBuilder: (context, index) {
        return const FruitItem();
      },
    );
  }
}
