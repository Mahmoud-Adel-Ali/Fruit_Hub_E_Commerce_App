import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const String routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'حساب جديد', showLeading: false),
    );
  }
}
