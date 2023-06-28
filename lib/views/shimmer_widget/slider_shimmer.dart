
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:omar_system/app_info.dart';

class CarouselSliderShimmer extends StatelessWidget {
  const CarouselSliderShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return CarouselSlider(
      options: CarouselOptions(
        height: 180.0,
        enlargeCenterPage: true,
        autoPlay: false,
        aspectRatio: 14 / 6,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayInterval: const Duration(seconds: 6),
        autoPlayAnimationDuration: const Duration(milliseconds: 3200),
        viewportFraction: 0.8,
      ),
      items: [
        Container(
          margin: const EdgeInsets.all(0.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular($borderRadius.toDouble()),
            child: Container(
              height: 130.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular($borderRadius.toDouble()),
              ),
            ),
          ),
        ),
      ], //items
    );
  }
}
