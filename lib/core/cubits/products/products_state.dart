part of 'products_cubit.dart';

class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsFailure extends ProductsState {
  final String message;
  ProductsFailure({required this.message});
}

class ProductsSuccess extends ProductsState {
  final List<ProductEntity> products;
  ProductsSuccess({required this.products});
}
