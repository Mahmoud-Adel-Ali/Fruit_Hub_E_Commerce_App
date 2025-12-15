import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';

class CartItemImage extends StatelessWidget {
  const CartItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width * 0.25,
      height: double.infinity,
      decoration: const BoxDecoration(color: AppColors.lightGreyWithOpacity),
      child: Image.asset(Assets.imagesTestFruitImage),
    );
  }
}
