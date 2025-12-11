import '../models/review_model.dart';

class ReviewEntity {
  final String name;
  final String image;
  final num rating;
  final String date;
  final String description;

  ReviewEntity({
    required this.name,
    required this.image,
    required this.rating,
    required this.date,
    required this.description,
  });

  factory ReviewEntity.fromModel(ReviewModel review) {
    return ReviewEntity(
      name: review.name,
      image: review.image,
      rating: review.rating,
      date: review.date,
      description: review.description,
    );
  }
}
