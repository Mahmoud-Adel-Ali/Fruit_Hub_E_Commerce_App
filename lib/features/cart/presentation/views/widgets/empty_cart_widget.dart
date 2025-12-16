import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cubits/cart/cart_cubit.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'cart_view_header.dart';

class EmptyCartWidget extends StatelessWidget {
  final VoidCallback? onStartShopping;

  const EmptyCartWidget({super.key, this.onStartShopping});

  @override
  Widget build(BuildContext context) {
    var cart = context.read<CartCubit>().cart;
    return Column(
      children: [
        CartViewHeader(productsLength: cart.cartItems.length),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 72,
                    color: AppColors.primaryColor,
                  ),

                  const SizedBox(height: 16),

                  Text(
                    "سلة التسوق فارغة",
                    style: AppTextStyles.semiBold16.copyWith(
                      color: AppColors.primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "أضف بعض المنتجات لتبدأ التسوق",
                    style: AppTextStyles.regular16.copyWith(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),

                  if (onStartShopping != null) ...[
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: onStartShopping,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text("ابدأ التسوق"),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
