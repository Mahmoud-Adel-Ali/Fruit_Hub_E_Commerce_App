// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../core/entities/product_entity.dart';

class CartItemEntity {
  int quantity;
  final ProductEntity product;

  CartItemEntity({required this.product, this.quantity = 0});

  num get totalPrice => product.price * quantity;
  num get totalWeight => product.unitAmount * quantity;

  int increaseQuantity() => quantity++;
  int decreaseQuantity() => quantity--;

  CartItemEntity copyWith({int? quantity, ProductEntity? product}) {
    return CartItemEntity(
      quantity: quantity ?? this.quantity,
      product: product ?? this.product,
    );
  }

  @override
  String toString() => 'CartItemEntity(quantity: $quantity, product: $product)';
}
