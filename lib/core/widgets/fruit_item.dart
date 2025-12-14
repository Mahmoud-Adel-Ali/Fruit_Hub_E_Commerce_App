import 'package:flutter/material.dart';

import '../entities/product_entity.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import 'custom_cached_network_image.dart';
import 'custom_circular_button.dart';
import 'favorit_icon.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        color: AppColors.lightGreyWithOpacity,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            child: FavoriteIcon(initialValue: false, onChanged: (value) {}),
          ),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return CustomCachedNetworkImage(
                        url: product.imgUrl,
                        fit: BoxFit.scaleDown,
                        height: constraints.maxHeight,
                        width: constraints.maxWidth,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 18),
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: Text(product.name, style: AppTextStyles.semiBold13),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: ' ${product.price.toInt()} جنية',
                          style: AppTextStyles.bold13.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: '/',
                          style: AppTextStyles.bold13.copyWith(
                            color: AppColors.lightSecondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: 'الكيلو',
                          style: AppTextStyles.bold13.copyWith(
                            color: AppColors.lightSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: CustomCircularButton(onPressed: () {}),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
