import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});
  static const String routeName = 'about-us-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'من نحن', showNotifications: false),
    );
  }
}
