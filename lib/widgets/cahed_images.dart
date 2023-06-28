import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../app_info.dart';

class CachedImageWidget extends StatelessWidget {
  final String imageUrl;
  final double width;

  const CachedImageWidget(
      {Key? key, required this.imageUrl, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular($imageBorderRadius.toDouble()),
      child: imageUrl == ''
          ? Image.asset(
              'assets/images/no-image-found.png',
              fit: BoxFit.cover,
            )
          : CachedNetworkImage(
              width: width,
              fit: BoxFit.cover,
              imageUrl: imageUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
              errorWidget: (context, url, error) =>
                  const Center(child: CircularProgressIndicator()),
            ),
    );
  }
}
