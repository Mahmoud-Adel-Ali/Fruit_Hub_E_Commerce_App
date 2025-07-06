import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, this.pageController});
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          backgroundImage: Assets.imagesPageViewItem1BackgroundImage,
          image: Assets.imagesPageViewItem1Image,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("مرحبًا بك في  ", style: AppTextStyles.bold23),
              Text(
                "HUB",
                style: AppTextStyles.bold23.copyWith(color: AppColors.secondaryColor),
              ),
              Text(
                "Fruit",
                style: AppTextStyles.bold23.copyWith(color: AppColors.primaryColor),
              ),
            ],
          ),
          subtitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
        ),
        PageViewItem(
          backgroundImage: Assets.imagesPageViewItem2BackgroundImage,
          image: Assets.imagesPageViewItem2Image,
          isLast: true,
          title: Text(
            'ابحث وتسوق',
            textAlign: TextAlign.center,
            style: AppTextStyles.bold28,
          ),
          subtitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
        ),
      ],
    );
  }
}
