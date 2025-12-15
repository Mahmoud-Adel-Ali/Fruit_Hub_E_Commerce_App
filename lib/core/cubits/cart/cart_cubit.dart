import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../features/cart/domain/entities/cart_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cart = CartEntity(cartItems: []);
}
