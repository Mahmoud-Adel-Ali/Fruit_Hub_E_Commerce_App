import 'package:bloc/bloc.dart';

import '../../entities/product_entity.dart';
import '../../repos/products_repo/products_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.repo) : super(ProductsInitial());

  final ProductsRepo repo;

  int productsLength = 0;

  Future<void> getProducts() async {
    emit(ProductsLoading());
    var result = await repo.getProducts();
    result.fold((failure) => emit(ProductsFailure(message: failure.message)), (
      products,
    ) {
      productsLength = products.length;
      emit(ProductsSuccess(products: products));
    });
  }
}
