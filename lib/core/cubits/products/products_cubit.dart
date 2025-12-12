import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../../entities/product_entity.dart';
import '../../repos/products_repo/products_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.repo) : super(ProductsInitial());

  final ProductsRepo repo;

  Future<void> getProducts() async {
    emit(ProductsLoading());
    var result = await repo.getProducts();
    result.fold(
      (failure) => emit(ProductsFailure(message: failure.message)),
      (products) => emit(ProductsSuccess(products: products)),
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(BestProductsLoading());
    var result = await repo.getBestSellingProducts();
    log(result.toString());
    result.fold(
      (failure) => emit(BestProductsFailure(message: failure.message)),
      (products) => emit(BestProductsSuccess(products: products)),
    );
  }
}
