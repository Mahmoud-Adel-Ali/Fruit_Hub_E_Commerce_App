import 'package:flutter/material.dart';

import 'shipping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: PageView.builder(
        itemCount: pages().length,
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => pages()[index],
      ),
    );
  }

  List<Widget> pages() => const [
    ShippingSection(),
    SizedBox(), // Address Section Placeholder
    SizedBox(), // Payment Section Placeholder
    SizedBox(), // Review Section Placeholder
  ];
}
