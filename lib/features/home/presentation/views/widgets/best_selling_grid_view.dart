import 'package:flutter/material.dart';

import '../../../../../core/entities/product_entity.dart';
import '../../../../../core/helper_functions/get_dummy_product.dart';
import '../../../../../core/widgets/fruit_item.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key, required this.products});
  final List<ProductEntity> products;
  // TODO : i'm not view the products , because firestore is not active.
  // then, after changing to supabase then back to show this
  // video 160 , 161 [are skipped].
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      // TODO : show real item count here
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
        childAspectRatio: 3 / 4,
      ),
      itemBuilder: (context, index) {
        //TODO : remove dummy product and add real product later.
        // final product = products[index];
        return FruitItem(product: getDummyProduct);
      },
    );
  }
}
