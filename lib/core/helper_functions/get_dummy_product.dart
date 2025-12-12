import 'dart:io';

import '../entities/product_entity.dart';

ProductEntity getDummyProduct = ProductEntity(
  name: "Banana",
  price: 12.5,
  code: "BN-001",
  description: "Fresh organic bananas from local farms.",
  image: File(""), // example file path
  isFeatured: true,
  imgUrl: null, // will be filled after upload to Supabase
  expirationMonths: 2,
  isOrganic: true,
  numOfCalories: 105,
  unitAmount: 6,
  avarageRating: 4.5,
  ratingCount: 20,
  reviews: [],
);

List<ProductEntity> dummyProducts = List.generate(
  6,
  (index) => getDummyProduct,
);
