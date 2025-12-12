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

class BestProductsLoading extends ProductsState {}

class BestProductsFailure extends ProductsState {
  final String message;
  BestProductsFailure({required this.message});
}

class BestProductsSuccess extends ProductsState {
  final List<ProductEntity> products;
  BestProductsSuccess({required this.products});
}
