import 'package:flutter/material.dart';

import '../../size_config.dart';

class CoursesCardShimmer extends StatelessWidget {
  final double width, aspectRetio;
  const CoursesCardShimmer({
    Key ? key,
    this.width = 0.70,
    this.aspectRetio = 1.02,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: screenWidthDivided(45,context),
          right: screenWidthDivided(45,context)),
      child: SizedBox(
        width: screenWidthMultiply(width, context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 2/1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            const SizedBox(height: 7),
            Container(
              height: 15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
