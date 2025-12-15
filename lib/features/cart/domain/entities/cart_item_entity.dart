import '../../../../core/entities/product_entity.dart';

class CartItemEntity {
  int quantity;
  final ProductEntity product;

  CartItemEntity({required this.product, this.quantity = 0});

  num get totalPrice => product.price * quantity;
  num get totalWeight => product.unitAmount * quantity;

  CartItemEntity increaseQuantity() => copyWith(quantity: quantity + 1);
  CartItemEntity decreaseQuantity() => copyWith(quantity: quantity - 1);

  CartItemEntity copyWith({int? quantity, ProductEntity? product}) {
    return CartItemEntity(
      quantity: quantity ?? this.quantity,
      product: product ?? this.product,
    );
  }
}
