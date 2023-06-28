import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../app_info.dart';

class CategoriesShimmer extends StatelessWidget {
  final double width, aspectRetio;
  const CategoriesShimmer({
    Key ? key,
    this.width = 0.70,
    this.aspectRetio = 1.02,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: MasonryGridView.count(
        physics: const ScrollPhysics(),
        shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        crossAxisCount: 2,
        mainAxisSpacing: 7,
        crossAxisSpacing: 12,
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            width: 95,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular($borderRadius.toDouble()),
              border: Border.all(color:checkDarkTheme(context.m)  ? $borderDarkColor
                  : $borderColor),
            ),

          );
        },
      ),
    );
  }
}
