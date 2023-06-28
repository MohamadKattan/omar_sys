import 'package:flutter/material.dart';

Widget customText(
    {required String? text, double? fSize, FontWeight? fWeight, Color? color}) {
  return Text(
    text ?? '',
    textAlign: TextAlign.center,
    style: TextStyle(
        color: color ?? Colors.black,
        height: 1.4,
        overflow: TextOverflow.ellipsis,
        fontWeight: fWeight ?? FontWeight.normal,
        fontSize: fSize ?? 16.0),
  );
}
