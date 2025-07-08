import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import 'login_form.dart';

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
            SizedBox(height: 24),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
