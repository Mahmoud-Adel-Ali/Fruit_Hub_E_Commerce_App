import '../models/review_model.dart';

num getAvgRating(List<ReviewModel> reviews) {
  double sumRating = 0.0;

  for (var review in reviews) {
    sumRating += review.rating;
  }

  num avgRating = sumRating / reviews.length;
  return avgRating;
}
