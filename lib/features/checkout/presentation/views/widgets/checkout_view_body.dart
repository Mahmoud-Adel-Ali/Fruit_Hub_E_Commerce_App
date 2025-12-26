import 'package:flutter/material.dart';
import 'package:fruit_hub_e_commerce_app/core/widgets/custom_button.dart';

import '../../../../../constants.dart';
import 'checkout_steps.dart';
import 'checkout_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController _pageController;
  int currentStep = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      int next = _pageController.page!.toInt();
      if (currentStep != next) {
        currentStep = next;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          SizedBox(height: 20),
          CheckoutSteps(
            currentStep: currentStep,
            pageController: _pageController,
          ),
          Expanded(
            child: CheckoutStepsPageView(pageController: _pageController),
          ),
          SizedBox(height: 16),
          CustomButton(
            text: getNextButtonText(currentStep),
            onPressed: () {
              if (currentStep < steps.length - 1) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  String getNextButtonText(int currentStep) {
    switch (currentStep) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return 'أدفع بواسطه PayPal';
      default:
        return 'التالي';
    }
  }
}
