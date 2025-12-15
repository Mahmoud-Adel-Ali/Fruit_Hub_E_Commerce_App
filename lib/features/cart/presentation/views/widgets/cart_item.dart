import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/fruit_counter.dart';
import '../../../domain/entities/cart_item_entity.dart';
import 'cart_item_image.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItem});
  final CartItemEntity cartItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 175,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5, color: AppColors.lightGrey),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Row(
          children: [
            //* image
            CartItemImage(cartItem: cartItem),
            //* description
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        cartItem.product.name,
                        style: AppTextStyles.bold16.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      subtitle: Text(
                        "${cartItem.totalWeight} كيلو",
                        style: AppTextStyles.bold13.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(Assets.imagesRemoveIcon),
                      ),
                    ),
                    const Spacer(),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: FruitCounter(
                        initialValue: cartItem.quantity,
                        onChanged: (value) {
                          log(value.toString());
                        },
                      ),
                      trailing: Text(
                        "${cartItem.totalPrice} جنيه",
                        style: AppTextStyles.bold16.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
