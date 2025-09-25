import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_text_styles.dart';
import 'custom_circular_button.dart';
import 'favorit_icon.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 222,
      width: 200,
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
                Image.asset(Assets.imagesTestFruitImage),
                Expanded(child: const SizedBox(height: 24)),
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: Text('فراولة', style: AppTextStyles.semiBold13),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '30جنية',
                          style: AppTextStyles.bold13.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: ' / ',
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
