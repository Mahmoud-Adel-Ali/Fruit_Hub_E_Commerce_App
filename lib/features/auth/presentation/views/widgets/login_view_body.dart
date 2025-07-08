import 'package:flutter/material.dart';
import 'package:fruit_hub_e_commerce_app/core/utils/app_colors.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import 'login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const LoginForm(),
            const SizedBox(height: 33),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('لَا تَمْلِكُ حِسَابًا؟', style: AppTextStyles.semiBold16),
                CustomTextButton(
                  text: "قُمْ بِإِنْشَاءِ حِسَابٍ",
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 33),
            Row(
              children: [
                Expanded(
                  child: Divider(color: AppColors.lightGrey, thickness: 1),
                ),
                Text('  أو  ', style: AppTextStyles.semiBold16),
                Expanded(
                  child: Divider(color: AppColors.lightGrey, thickness: 1),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
