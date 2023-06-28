  //totel
  import 'package:flutter/material.dart';

import '../../../app_info.dart';
import '../../../size_config.dart';
import 'custom_text.dart';

Widget customeTotleContainer(
      {String? title,
      String? txt1,
      String? val1,
      String? txt2,
      String? val2,
      String? txt3,
      String? val3,
      String? txt4,
      String? val4,
      String? txt5,
      String? val5,
     required BuildContext context
      }) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 650),
      padding:
          EdgeInsets.symmetric(horizontal: screenWidthMultiply(0.10, context)),
      decoration: BoxDecoration(
        color: checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 0.4,
            spreadRadius: 1,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: customText(
                text: title ?? '',
                fSize: 24,
                fWeight: FontWeight.bold,
                color: Colors.orange.shade400),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  customText(
                      text: txt1,
                      fSize: 20,
                      color: checkDarkTheme(context.m)
                          ? $mainColor
                          : $mainLightColor,
                      fWeight: FontWeight.bold),
                  customText(
                      text: val1,
                      fSize: 18,
                      color: checkDarkTheme(context.m)
                          ? Colors.orange.shade300
                          : Colors.blueGrey.shade400,
                      fWeight: FontWeight.bold),
                ],
              ),
              Column(
                children: [
                  customText(
                      text: txt2,
                      fSize: 18,
                      color: checkDarkTheme(context.m)
                          ? $mainColor
                          : $mainLightColor,
                      fWeight: FontWeight.bold),
                  customText(
                      text: val2,
                      fSize: 18,
                      color: checkDarkTheme(context.m)
                          ? Colors.orange.shade300
                          : Colors.blueGrey.shade400,
                      fWeight: FontWeight.bold),
                ],
              ),
            ],
          ),
          SizedBox(height: screenHeightMultiply(0.02, context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  customText(
                      text: txt3,
                      fSize: 20,
                      color: checkDarkTheme(context.m)
                          ? $mainColor
                          : $mainLightColor,
                      fWeight: FontWeight.bold),
                  customText(
                      text: val3,
                      fSize: 18,
                      color: checkDarkTheme(context.m)
                          ? Colors.orange.shade300
                          : Colors.blueGrey.shade400,
                      fWeight: FontWeight.bold),
                ],
              ),
              Column(
                children: [
                  customText(
                      text: txt4,
                      fSize: 20,
                      color: checkDarkTheme(context.m)
                          ? $mainColor
                          : $mainLightColor,
                      fWeight: FontWeight.bold),
                  customText(
                      text: val4,
                      fSize: 18,
                      color: checkDarkTheme(context.m)
                          ? Colors.orange.shade300
                          : Colors.blueGrey.shade400,
                      fWeight: FontWeight.bold),
                ],
              ),
            ],
          ),
          SizedBox(height: screenHeightMultiply(0.02, context)),
          txt3 == null
              ? const SizedBox()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        customText(
                            text: txt5,
                            fSize: 20,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                            fWeight: FontWeight.bold),
                        customText(
                            text: val5,
                            fSize: 18,
                            color: checkDarkTheme(context.m)
                                ? Colors.orange.shade300
                                : Colors.blueGrey.shade400,
                            fWeight: FontWeight.bold),
                      ],
                    ),
                    Column(
                      children: [
                        customText(
                            text: '', fSize: 20, fWeight: FontWeight.bold),
                        customText(
                            text: '',
                            fSize: 18,
                            color: checkDarkTheme(context.m)
                                ? Colors.orange.shade300
                                : Colors.blueGrey.shade400,
                            fWeight: FontWeight.bold),
                      ],
                    ),
                  ],
                ),
        ],
      ),
    );
  }