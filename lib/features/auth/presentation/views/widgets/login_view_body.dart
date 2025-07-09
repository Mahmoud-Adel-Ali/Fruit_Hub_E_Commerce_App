import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../signup_view.dart';
import 'login_form.dart';
import 'login_signup_switch_row.dart';
import 'login_social_section.dart';
import 'or_divider.dart';

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
            LoginSignupSwitchRow(
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
            const LoginSocialSection(),
            const SizedBox(height: 42),
          ],
        ),
      ),
    );
  }
}
