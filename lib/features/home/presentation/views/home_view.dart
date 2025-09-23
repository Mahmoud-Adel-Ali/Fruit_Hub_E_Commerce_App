import 'package:flutter/material.dart';

import 'widgets/home_view_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'home_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: homeViewAppBar());
  }
}
