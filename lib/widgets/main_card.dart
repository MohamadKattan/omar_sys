import 'package:flutter/material.dart';

import '../app_info.dart';
import '../size_config.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key, this.cardChild, required this.color});
  final Widget? cardChild;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: screenHeightMultiply(0.01, context),
          bottom: screenHeightMultiply(0.01, context),
          right: screenHeightMultiply(0.01, context),
          left: screenHeightMultiply(0.01, context)),
      // width: screenWidthMultiply(1, context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular($borderRadius.toDouble()),
        color: checkDarkTheme(context.m) ? Colors.black : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      // decoration: BoxDecoration(
      //     color: color, borderRadius: BorderRadius.circular(10.0)),
      child: cardChild,
    );
  }
}
