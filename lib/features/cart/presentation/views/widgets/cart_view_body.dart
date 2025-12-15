import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cubits/cart/cart_cubit.dart';
import '../../../../../core/utils/app_colors.dart';
import 'cart_items_list_view.dart';
import 'cart_view_header.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        var cart = context.read<CartCubit>().cart;
        return SingleChildScrollView(
          child: Column(
            children: [
              CartViewHeader(productsLength: cart.cartItems.length),
              SizedBox(height: 24),
              if (cart.cartItems.isNotEmpty)
                Divider(color: AppColors.lightGrey, thickness: 1, height: 0),
              CartItemsListView(cartItems: cart.cartItems),
            ],
          ),
        );
      },
    );
  }
}
