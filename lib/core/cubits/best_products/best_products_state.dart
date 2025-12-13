part of 'best_products_cubit.dart';

class BestProductsState {}

class BestProductsInitial extends BestProductsState {}

class BestProductsLoading extends BestProductsState {}

class BestProductsFailure extends BestProductsState {
  final String message;
  BestProductsFailure({required this.message});
}

class BestProductsSuccess extends BestProductsState {
  final List<ProductEntity> products;
  BestProductsSuccess({required this.products});
}
