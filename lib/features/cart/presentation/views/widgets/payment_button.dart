import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cubits/cart/cart_cubit.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../checkout/presentation/views/checkout_view.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        var totalPrice = context.read<CartCubit>().cart.calcTotalPrice();
        return AbsorbPointer(
          absorbing: totalPrice <= 0,
          child: Opacity(
            opacity: totalPrice <= 0 ? 0.5 : 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: Colors.transparent,
              child: CustomButton(
                text: "الدفع $totalPrice جنيه",
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    CheckoutView.routeName,
                    arguments: context.read<CartCubit>().cart,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
