import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../models/slider_models.dart';
import '../../../widgets/slider_widget.dart';

class HomeSlider extends StatelessWidget {
  final List<SliderModel> sliderList;
  const HomeSlider({Key? key ,required this.sliderList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(

      options: CarouselOptions(

        enlargeCenterPage: true,
        autoPlay: false,
        aspectRatio: 14 / 6,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayInterval: const Duration(seconds: 6),
        autoPlayAnimationDuration: const Duration(milliseconds: 10000),
        viewportFraction: 0.99,
      ),
      items: [
        for (var index in sliderList)
          CarouselSliderImage(image: index.imageUrl ,  id:index.id)
      ], //items
    );
  }
}
