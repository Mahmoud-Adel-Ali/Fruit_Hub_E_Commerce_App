import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'featured_item.dart';

class FeaturedFruitItems extends StatelessWidget {
  const FeaturedFruitItems({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: true,
        viewportFraction: 1,
        aspectRatio: 2.165,
        animateToClosest: true,
      ),
      items: [
        ...List.generate(4, (index) {
          return FeaturedItem();
        }),
      ],
    );
  }
}
