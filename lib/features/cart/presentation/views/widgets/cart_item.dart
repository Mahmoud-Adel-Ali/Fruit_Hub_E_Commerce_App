import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
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
            CartItemImage(),
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
                        "فراولة",
                        style: AppTextStyles.bold16.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      subtitle: Text(
                        "3 كيلو",
                        style: AppTextStyles.bold13.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(Assets.imagesRemoveIcon),
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
