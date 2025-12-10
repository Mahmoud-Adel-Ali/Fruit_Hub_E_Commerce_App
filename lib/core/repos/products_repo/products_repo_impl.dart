import 'package:dartz/dartz.dart';

import '../../entities/product_entity.dart';
import '../../errors/failures.dart';
import '../../services/database_service.dart';
import 'products_repo.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseService service;

  ProductsRepoImpl({required this.service});

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() {
    // TODO: implement getBestSellingProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}
