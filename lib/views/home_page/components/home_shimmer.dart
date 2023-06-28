import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../size_config.dart';
import '../../shimmer_widget/categories_shimmer.dart';
import '../../shimmer_widget/courses_card_shimmer.dart';
import '../../shimmer_widget/slider_shimmer.dart';
import '../../shimmer_widget/title_shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.01),
      highlightColor: Colors.grey.withOpacity(0.3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenHeightMultiply(0.02, context),
          ),
          const CarouselSliderShimmer(),

          SizedBox(
            height: screenHeightMultiply(0.02, context),
          ),
          const TitleCardShimmer(),
          SizedBox(
            height: screenHeightMultiply(0.02, context),
          ),
          const CategoriesShimmer(),
          SizedBox(
            height: screenHeightMultiply(0.03, context),
          ),
          const TitleCardShimmer(),
          SizedBox(
            height: screenHeightMultiply(0.03, context),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...List.generate(
                  6,
                      (index) {
                    return const CoursesCardShimmer();
                  },
                ),
                SizedBox(width: screenWidthDivided(20,context)),
              ],
            ),
          ),
          SizedBox(
            height: screenHeightMultiply(0.03, context),
          ),
          const TitleCardShimmer(),
          SizedBox(
            height: screenHeightMultiply(0.03, context),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...List.generate(
                  6,
                      (index) {
                    return const CoursesCardShimmer();
                  },
                ),
                SizedBox(width: screenWidthDivided(20,context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


