import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

var emptyImage =
    "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAACUCAMAAABSgr46AAAAZlBMVEXw8fP6+/2Ai5Hz9Pbr7/N0gIXQ1NrQ0tRwe4Sjqa94foPv8vJzgIPu7u9ugIL19fV3gIl6hovIz9Hl6emUnqPa3uGFj5ji6OyosLff3+Xu8e2GkpaLk5mdpKtxgIi6wsSvtrikrKsvc7KzAAADOklEQVR4nO3b63aiMBQF4MAhomJKQCg4YtX3f8kJoBa5OMPIdJ1k7b36T0r5yDYEqsKbDAl7QtMMAaEdgRBC/oEQQv6BEEL+gRBC/oEQQv6BEEL+gRBC/oEQQv6BEEL+gRBC/oEQQv6BEEL+gRBC/oEQQv6BcDEhRUscLYnZu/kpIeXhEjnQL5ZCJUR+lHL9bvS6Cmef3B8aQ6r0afN+Tl8VT2EUBR/rIJh7bMOo9Xb2Xn5MKL25hzYSj7FwJ2mBMYwZCz92C1wtFG/hAqsECEfDT6jU9EuOCOsfGt3aEWGcp+dzuh/b3AGh2YbCLNFalsXI9g4IzfEUifRN1ic3hUpRKf2kIa6Gv+CAMFLU8EzkxaP+rOqcUDgoNMeT3Yjy7A0ujC4IFaU7XQOTZOR64YRQ0CWpc0zdnEsbxnmTncoxoCNCM4r7/BA4vGqrp5d6VTq2/rZNqAxk5NmganEOCJXYpzOfflompP31GMaz9mOT0CxAi1Imx1WsXgyj6nXVKiHtS3Nl159h/FL4vDS1SWgq2ixd9DF88RyVivz5vNgirCu6ke3yU5uijs2ozbEFZXWg6PsxpD1C2m/07RbCFDWdKmp00TrrjqIlwnrRct09gL6Zbob3SfVWgVmh+rJLtEPYrWib5HPl9WdUs1XQ3u0bYnz3WyLsVvRRVK8vrCt6OwGGaJHQlK+4Jn4v/aK2FX2cgCz3rBHWFT3JPrAdxe+iNhXtnAadHeLIFqGp6HoIbImPq0Knoo+ikhVCJeKRit6Lmnr3m4puRe/Eg2eFcLyiz0VtKqr7r9ajGHEXRqaip8GhD4o6qOiNWJnphrdwS1RkExXtFHWkom2+DJG1UGqveDWCt1EkonLqnWqKSqyF0Z+A9RIuFMP3YIfI+rMY/tQs+oSopkawffWgOQv/Alg/6n75auZzFi6RxHmhDyGE/0so3BeKaOu6kI6TS+5Z0Uw/QWv+zKraygXC91PQQuThaoHkiq9QRPR2xMT/FZkI539TYriHf9kFvjMDIf9ACCH/QAgh/0AIIf9ACCH/QAgh/0AIIf9ACCH/QAgh/0AIIf9ACCH/QAgh/0AIIf9ACCH/QAgh/7wQ/gajMWFDpLUEEgAAAABJRU5ErkJggg==";

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    this.imgUrl,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  });
  final String? imgUrl;
  final double? height, width;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: (imgUrl != null && imgUrl!.isNotEmpty) ? imgUrl! : emptyImage,
      height: height,
      width: width,
      fit: fit,
      errorWidget: ((context, error, stackTrace) =>
          const Icon(Icons.account_circle)),
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(color: AppColors.primaryColor),
      ),
    );
  }
}

DecorationImage customCachedNetworkImageprovider(
  String? imgPath, {
  BoxFit? fit,
}) {
  return DecorationImage(
    fit: fit ?? BoxFit.cover,
    image: CachedNetworkImageProvider(
      (imgPath != null && imgPath.isNotEmpty) ? imgPath : emptyImage,
    ),
    onError: (exception, stackTrace) =>
        const Icon(Icons.account_circle, color: AppColors.red),
  );
}
