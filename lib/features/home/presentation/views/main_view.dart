import 'package:flutter/material.dart';

import 'widgets/custom_bottom_navigation_bar.dart';
import 'widgets/home_view_app_bar.dart';
import 'widgets/home_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const routeName = 'home_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Home View App Bar
      appBar: homeViewAppBar(),
      // Home View Body
      body: const HomeView(),
      // custom bottom navigation bar
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
