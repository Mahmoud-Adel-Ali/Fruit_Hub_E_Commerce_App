import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

var emptyImg = "https://syria.adra.cloud/wp-content/uploads/2021/10/empty.jpg";

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    this.url,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  });
  final String? url;
  final double? height, width;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    var finalUrl = (url != null && url!.isNotEmpty) ? url! : emptyImg;
    return CachedNetworkImage(
      imageUrl: finalUrl,
      height: height,
      width: width,
      fit: fit,
      errorWidget: ((context, error, stackTrace) =>
          const Icon(Icons.error_outline_outlined, color: AppColors.red)),
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(color: AppColors.primaryColor),
      ),
    );
  }
}

CachedNetworkImageProvider customCachedNetworkImageprovider({String? url}) {
  var finalUrl = (url != null && url.isNotEmpty) ? url : emptyImg;
  return CachedNetworkImageProvider(
    finalUrl,
    errorListener: (error) {
      log("Image load error: $error");
      log("Image url: $finalUrl");
    },
    cacheKey: finalUrl,
  );
}
