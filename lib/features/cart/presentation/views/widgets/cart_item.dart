import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants.dart';
import '../../../../../core/cubits/cart/cart_cubit.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../../../../core/widgets/fruit_counter.dart';
import '../../../../../core/widgets/toast_helper.dart';
import '../../../domain/entities/cart_item_entity.dart';
import 'cart_item_image.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItem});
  final CartItemEntity cartItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 175,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5, color: AppColors.lightGrey),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Row(
          children: [
            //* image
            CartItemImage(cartItem: cartItem),
            //* description
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        cartItem.product.name,
                        style: AppTextStyles.bold16.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      subtitle: Text(
                        "${cartItem.totalWeight} كيلو",
                        style: AppTextStyles.bold13.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          DialogHelper.showQuestionDialog(
                            context,
                            title: "تأكيد الحذف",
                            desc: "هل أنت متأكد من حذف هذا المنتج من السلة؟",
                            onOk: () {
                              context.read<CartCubit>().removeItemFromCart(
                                cartItem,
                              );
                              ToastHelper.showErrorToast(
                                "تم حذف المنتج من السلة",
                              );
                            },
                          );
                        },
                        icon: SvgPicture.asset(Assets.imagesRemoveIcon),
                      ),
                    ),
                    const Spacer(),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: FruitCounter(
                        initialValue: cartItem.quantity,
                        onAdd: (value) {
                          context.read<CartCubit>().addItemToCart(cartItem);
                        },
                        onRemove: (value) {
                          context.read<CartCubit>().decreaseItemQuantity(
                            cartItem,
                          );
                        },
                      ),
                      trailing: Text(
                        "${cartItem.totalPrice} جنيه",
                        style: AppTextStyles.bold16.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
