import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    return AspectRatio(
      aspectRatio: 2.165,
      child: Container(
        width: screenWidth,
        decoration: ShapeDecoration(
          color: AppColors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Image.asset(
                Assets.imagesTestFeatureFruitImage,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: screenWidth / 2,
                padding: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.elliptical(16, 100),
                    bottomLeft: Radius.elliptical(16, 100),
                    bottomRight: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(flex: 2),
                    Text(
                      'عروض العيد',
                      style: AppTextStyles.bold13.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    const Spacer(flex: 1),
                    Column(
                      spacing: 11,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'خصم 25%',
                          style: AppTextStyles.bold19.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: CustomButton(
                            text: 'تسوق الان',
                            color: AppColors.white,
                            textColor: AppColors.green,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 29),
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
