import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../about_us_view.dart';
import 'profile_button.dart';

class AboutUsProfileViewSection extends StatelessWidget {
  const AboutUsProfileViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'المساعده',
            style: AppTextStyles.bold19.copyWith(color: AppColors.black),
          ),
          const SizedBox(height: 8),
          ProfileButton(
            svg: Assets.imagesOurInfoIcon,
            title: 'من نحن', // 'About Us'
            onTap: () {
              Navigator.pushNamed(context, AboutUsView.routeName);
            },
          ),
        ],
      ),
    );
  }
}
