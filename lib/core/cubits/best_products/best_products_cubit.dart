import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../../entities/product_entity.dart';
import '../../repos/products_repo/products_repo.dart';

part 'best_products_state.dart';

class BestProductsCubit extends Cubit<BestProductsState> {
  BestProductsCubit(this.repo) : super(BestProductsInitial());

  final ProductsRepo repo;

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
