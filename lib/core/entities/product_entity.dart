import 'dart:io' show File;

import '../models/product_model.dart';
import 'review_entity.dart';

class ProductEntity {
  final String name;
  final num price;
  final String code;
  final String description;
  final bool isFeatured;
  final String? imgUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numOfCalories;
  final int unitAmount;
  final num avarageRating;
  final int ratingCount;
  final List<ReviewEntity> reviews;

  const ProductEntity({
    required this.name,
    required this.price,
    required this.code,
    required this.description,
    required this.isFeatured,
    this.imgUrl,
    required this.expirationMonths,
    required this.isOrganic,
    required this.numOfCalories,
    required this.unitAmount,
    this.avarageRating = 0,
    this.ratingCount = 0,
    this.reviews = const [],
  });

  ProductEntity copyWith({
    String? name,
    num? price,
    String? code,
    String? description,
    File? image,
    bool? isFeatured,
    String? imgUrl,
    int? expirationMonths,
    bool? isOrganic,
    int? numOfCalories,
    int? unitAmount,
    num? avarageRating,
    int? ratingCount,
    List<ReviewEntity>? reviews,
  }) {
    return ProductEntity(
      name: name ?? this.name,
      price: price ?? this.price,
      code: code ?? this.code,
      description: description ?? this.description,
      isFeatured: isFeatured ?? this.isFeatured,
      imgUrl: imgUrl ?? this.imgUrl,
      expirationMonths: expirationMonths ?? this.expirationMonths,
      isOrganic: isOrganic ?? this.isOrganic,
      numOfCalories: numOfCalories ?? this.numOfCalories,
      unitAmount: unitAmount ?? this.unitAmount,
      avarageRating: avarageRating ?? this.avarageRating,
      ratingCount: ratingCount ?? this.ratingCount,
      reviews: reviews ?? this.reviews,
    );
  }

  factory ProductEntity.fromModel(ProductModel product) {
    return ProductEntity(
      name: product.name,
      price: product.price,
      code: product.code,
      description: product.description,
      isFeatured: product.isFeatured,
      expirationMonths: product.expirationMonths,
      isOrganic: product.isOrganic,
      numOfCalories: product.numOfCalories,
      unitAmount: product.unitAmount,
      avarageRating: product.avarageRating,
      imgUrl: product.imgUrl,
      ratingCount: product.ratingCount,
      reviews: product.reviews.map((e) => ReviewEntity.fromModel(e)).toList(),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductEntity &&
          name == other.name &&
          price == other.price &&
          code == other.code
  // &&
  // description == other.description &&
  // isFeatured == other.isFeatured &&
  // imgUrl == other.imgUrl &&
  // expirationMonths == other.expirationMonths &&
  // isOrganic == other.isOrganic &&
  // numOfCalories == other.numOfCalories &&
  // unitAmount == other.unitAmount &&
  // avarageRating == other.avarageRating &&
  // ratingCount == other.ratingCount
  ;

  @override
  int get hashCode => Object.hash(
    name,
    price,
    code,
    description,
    isFeatured,
    imgUrl,
    expirationMonths,
    isOrganic,
    numOfCalories,
    unitAmount,
    avarageRating,
    ratingCount,
  );
}
