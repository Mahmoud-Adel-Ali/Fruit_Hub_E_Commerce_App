import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';
import 'social_auth_button.dart';

class LoginSocialSection extends StatelessWidget {
  const LoginSocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        SocialAuthButton(
          text: 'تسجيل بواسطة جوجل',
          icon: Assets.imagesGoogleIcon,
          onPressed: () {},
        ),
        SocialAuthButton(
          text: "تسجيل بواسطة أبل",
          icon: Assets.imagesAppleIcon,
          onPressed: () {},
        ),
        SocialAuthButton(
          text: 'تسجيل بواسطة فيسبوك',
          icon: Assets.imagesFacebookIcon,
          onPressed: () {},
        ),
      ],
    );
  }
}
