import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import 'dont_have_account_widget.dart';
import 'login_form.dart';
import 'or_divider.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            SizedBox(height: 24),
            LoginForm(),
            SizedBox(height: 33),
            DontHaveAccountWidget(),
            SizedBox(height: 33),
            OrDivider(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
