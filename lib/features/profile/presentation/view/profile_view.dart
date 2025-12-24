import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'حسابي', showBack: false),
    );
  }
}
