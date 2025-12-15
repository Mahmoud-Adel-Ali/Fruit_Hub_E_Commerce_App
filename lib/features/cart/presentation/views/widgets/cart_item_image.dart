import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../domain/entities/cart_item_entity.dart';

class CartItemImage extends StatelessWidget {
  const CartItemImage({super.key, required this.cartItem});
  final CartItemEntity cartItem;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width * 0.25,
      height: double.infinity,
      decoration: const BoxDecoration(color: AppColors.lightGreyWithOpacity),
      child: CustomCachedNetworkImage(url: cartItem.product.imgUrl),
    );
  }
}
