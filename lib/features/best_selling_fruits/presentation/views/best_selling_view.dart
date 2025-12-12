import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/best_selling_fruits_grid_view.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const String routeName = 'best_selling_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'الأكثر مبيعًا'),
      // TODO : get real products and show them
      body: BestSellingFruitsGridView(products: []),
    );
  }
}
