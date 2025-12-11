import 'package:dartz/dartz.dart';

import '../../entities/product_entity.dart';
import '../../errors/failures.dart';
import '../../models/product_model.dart';
import '../../services/database_service.dart';
import '../../utils/end_points.dart';
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
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await service.getData(path: EndPoints.getProduct)
              as List<Map<String, dynamic>>;
      //* response is List<Map<String , dynamic>>
      var products = data
          .map((e) => ProductEntity.fromModel(ProductModel.fromJson(e)))
          .toList();
      return Right(products);
    } catch (e) {
      return Left(ServerFailure('Failed to get products.'));
    }
  }
}
