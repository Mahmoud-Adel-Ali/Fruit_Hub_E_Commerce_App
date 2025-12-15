// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});

  //* Add item to cart
  void addItemToCart(CartItemEntity cartItem) {
    //* If the item is in the cart, update the quantity
    //* else add it to the cart
    if (isItemInCart(cartItem)) {
      cartItems
          .firstWhere((item) => item.product.code == cartItem.product.code)
          .increaseQuantity();
    } else {
      cartItems.add(cartItem);
    }
  }

  //* Decrease item quantity in cart
  void decreaseItemQuantity(CartItemEntity cartItem) {
    cartItems
        .firstWhere((item) => item.product.code == cartItem.product.code)
        .decreaseQuantity();
  }

  //* Remove item from cart
  void removeItemFromCart(CartItemEntity cartItem) {
    cartItems.removeWhere((item) => item.product.code == cartItem.product.code);
  }

  //* Check the item in cart
  bool isItemInCart(CartItemEntity cartItem) =>
      cartItems.any((item) => item.product.code == cartItem.product.code);

  num calcTotalPrice() {
    num totalPrice = 0;
    for (var item in cartItems) {
      totalPrice += item.totalPrice;
    }
    return totalPrice;
  }

  @override
  String toString() => 'CartEntity(cartItems: $cartItems)';
}
