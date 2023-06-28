import 'package:flutter/material.dart';
import 'package:omar_system/app_info.dart';

import 'cahed_images.dart';

class CarouselSliderImage extends StatelessWidget {
  final String? link;
  final String image,id;
  const CarouselSliderImage({Key? key, this.link, required this.image, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular($borderRadius.toDouble()),
        child:
        CachedImageWidget(imageUrl:image,width: 500, ),
      ),
    );
  }
}
