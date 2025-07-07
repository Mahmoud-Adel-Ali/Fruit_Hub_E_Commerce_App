// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub_e_commerce_app/features/auth/presentation/views/login_view.dart';

import '../../../../../core/databases/cach_helper.dart';
import '../../../../../core/databases/cach_keys.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../on_boarding/presentation/views/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    executeNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          alignment: Alignment.topLeft,
          width: double.infinity,
          child: SvgPicture.asset(Assets.imagesPlant),
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(Assets.imagesSplashBottomDots, fit: BoxFit.fill),
      ],
    );
  }

  void executeNavigation() {
    bool isOnBoardingViewSeen =
        getit.get<CacheHelper>().getBool(CachKeys.isOnBoardingViewSeen) ??
        false;
    Future.delayed(const Duration(seconds: 3), () {
      isOnBoardingViewSeen
          ? Navigator.pushReplacementNamed(context, LoginView.routeName)
          : Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    });
  }
}
