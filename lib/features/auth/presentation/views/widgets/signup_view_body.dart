import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../signin_view.dart';
import 'signin_signup_switch_row.dart';
import 'signup_form.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const SignupForm(),
            const SizedBox(height: 26),
            SigninSignupSwitchRow(
              questionText: 'تَمْتَلِكَ حِسَابًا بِالْفِعْلِ؟',
              actionText: "تَسْجِيلُ دُخُولٍ",
              onPressed: () {
                Navigator.of(
                  context,
                ).pushReplacementNamed(SigninView.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
