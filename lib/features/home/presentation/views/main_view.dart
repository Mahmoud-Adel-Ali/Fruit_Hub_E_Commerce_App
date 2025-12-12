import 'package:flutter/material.dart';

import 'home_view.dart';
import 'products_view.dart';
import 'widgets/custom_bottom_navigation_bar.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const routeName = 'home_view';

  @override
  Widget build(BuildContext context) {
    return const MainViewBody();
  }
}

class MainViewBody extends StatefulWidget {
  const MainViewBody({super.key});

  @override
  State<MainViewBody> createState() => _MainViewBodyState();
}

class _MainViewBodyState extends State<MainViewBody> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Home View Body
      body: getCurrentView(),
      // custom bottom navigation bar
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (index) {
          currentIndex = index;
          setState(() {});
        },
      ),
    );
  }

  Widget getCurrentView() {
    return [
      const HomeView(), // Home View
      const ProductsView(), // Products View
      const HomeView(), // Cart View
      const HomeView(), // Profile View
    ][currentIndex];
  }
}
