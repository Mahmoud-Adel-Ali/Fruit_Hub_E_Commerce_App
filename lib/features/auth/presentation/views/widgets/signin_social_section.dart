import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_images.dart';
import '../../cubits/signin_cubit/signin_cubit.dart';
import 'social_auth_button.dart';

class SigninSocialSection extends StatelessWidget {
  const SigninSocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        SocialAuthButton(
          text: 'تسجيل بواسطة جوجل',
          icon: Assets.imagesGoogleIcon,
          onPressed: () => context.read<SigninCubit>().signInWithGoogle(),
        ),
        SocialAuthButton(
          text: "تسجيل بواسطة أبل",
          icon: Assets.imagesAppleIcon,
          onPressed: () => context.read<SigninCubit>().signInWithApple(),
        ),
        SocialAuthButton(
          text: 'تسجيل بواسطة فيسبوك',
          icon: Assets.imagesFacebookIcon,
          onPressed: () => context.read<SigninCubit>().signInWithFacebook(),
        ),
      ],
    );
  }
}
