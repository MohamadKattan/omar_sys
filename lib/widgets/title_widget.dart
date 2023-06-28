import 'package:flutter/material.dart';
import 'package:omar_system/size_config.dart';

import '../app_info.dart';


class TitleWidget extends StatelessWidget {
  final String title;
  final Color? color;
  final bool haveBorder;

  const TitleWidget({Key? key, required this.title, this.color, required this.haveBorder})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                  color: color ?? Colors.black12,
                  width: haveBorder?  1.0 : 0,
                ))),
        child: Text(
          title,
          textAlign: TextAlign.start,
          style: TextStyle
            (

            color: checkDarkTheme(context.m)  ? $DarkTitleColor : $titleColor,
            fontSize: screenHeightDivided(55, context),
            fontWeight:FontWeight.w600 ,
          ),
        ),
      ),
    );
  }
}
