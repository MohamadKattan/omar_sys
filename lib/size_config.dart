// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;
  static double? textScale;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    orientation = MediaQuery.of(context).orientation;
    textScale = MediaQuery.of(context).textScaleFactor;
  }
}

bool isMobile(context) {
  var mobile = true;
  if (MediaQuery.of(context).size.width >= 450) {
    mobile = false;
  }
  return mobile;
}

double screenHeightMultiply(double inputHeight, context) {
  double? screenHeight = MediaQuery.of(context).size.height;
  return inputHeight * screenHeight;
}

double screenWidthMultiply(double inputWidth, context) {
  double? screenWidth = MediaQuery.of(context).size.width;
  num width;

  if (screenWidth >= 420) {
    width = 420;
  } else {
    width = screenWidth;
  }
  return inputWidth * width;
}

double screenHeightDivided(double inputHeight, context) {
  double? screenHeight = MediaQuery.of(context).size.height;
  return screenHeight / inputHeight;
}

double screenWidthDivided(double inputWidth, context) {
  double? screenWidth = MediaQuery.of(context).size.width;
  num width;
  if (screenWidth >= 420) {
    width = 420;
  } else {
    width = screenWidth;
  }

  return width / inputWidth;
}

// double getProportionateScreenHeight(double inputHeight) {
//   double? screenHeight = SizeConfig.screenHeight;
//   return (inputHeight / 812.0) * screenHeight!;
// }
//
// double getProportionateScreenWidth(double inputWidth) {
//   double? screenWidth = SizeConfig.screenWidth;
//   return (inputWidth / 375.0) * screenWidth!;
// }
