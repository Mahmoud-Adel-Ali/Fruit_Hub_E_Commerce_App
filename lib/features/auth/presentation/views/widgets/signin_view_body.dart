import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../signup_view.dart';
import 'or_divider.dart';
import 'signin_form.dart';
import 'signin_signup_switch_row.dart';
import 'signin_social_section.dart';

class SigninViewBody extends StatelessWidget {
  const SigninViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const SigninForm(),
            const SizedBox(height: 33),
            SigninSignupSwitchRow(
              questionText: 'لَا تَمْلِكُ حِسَابًا؟',
              actionText: "قُمْ بِإِنْشَاءِ حِسَابٍ",
              onPressed: () {
                Navigator.of(
                  context,
                ).pushReplacementNamed(SignupView.routeName);
              },
            ),
            const SizedBox(height: 33),
            const OrDivider(),
            const SizedBox(height: 16),
            const SigninSocialSection(),
            const SizedBox(height: 42),
          ],
        ),
      ),
    );
  }
}
