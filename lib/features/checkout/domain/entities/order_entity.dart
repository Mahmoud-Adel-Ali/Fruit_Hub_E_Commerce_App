import '../../../cart/domain/entities/cart_entity.dart';
import 'shipping_address_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  final bool? payWithCash;
  final ShippingAddressEntity? shippingAddress;

  OrderEntity({
    required this.cartEntity,
    this.payWithCash,
    this.shippingAddress,
  });
}
