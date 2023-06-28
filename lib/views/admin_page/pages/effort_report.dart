// this widget for display data from effoet  api

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../app_info.dart';
import '../../../services/provider.dart';
import '../../../size_config.dart';
import '../componen/custom_text.dart';

Widget effortReport(BuildContext context) {
  final valLisner = context.read<ProviderListiner>().listAgentsEffort;
  return Column(
    children: [
      SizedBox(height: screenHeightMultiply(0.01, context)),
      Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey.shade300,
        ),
        child: customText(
            text: context.t!.effortTitle,
            fSize: 24.0,
            color: checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
            fWeight: FontWeight.bold),
      ),
      SizedBox(height: screenHeightMultiply(0.01, context)),
      SizedBox(
        height: MediaQuery.of(context).size.height * 65 / 100,
        child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: valLisner.length,
            itemBuilder: (_, i) {
              return Container(
                margin: const EdgeInsets.all(12.0),
                constraints: const BoxConstraints(maxWidth: 650),
                decoration: BoxDecoration(
                  color:
                      checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 0.4,
                      spreadRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: customText(
                        text: valLisner[i].agentName ?? 'null',
                        fSize: 18.0,
                        color: checkDarkTheme(context.m)
                            ? $mainColor
                            : $mainLightColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          pecentIndector(
                              title: context.t!.dayEffort,
                              perc: valLisner[i].effortDay ?? 0,
                              txtIndector: valLisner[i].effortDay.toString()),
                          pecentIndector(
                              title: context.t!.monthEffort,
                              perc: valLisner[i].effortMonth ?? 0,
                              txtIndector: valLisner[i].effortMonth.toString()),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    ],
  );
}

Widget pecentIndector(
    {required String title, required int perc, required String txtIndector}) {
  return Container(
    padding: const EdgeInsets.all(8.0),
    width: 120.0,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: customText(text: title),
        ),
        CircularPercentIndicator(
          radius: 45.0,
          lineWidth: 4.0,
          animation: true,
          percent: valofDouble(perc),
          center: Text(txtIndector),
          progressColor: perc > 100 ? Colors.green : Colors.redAccent,
        ),
      ],
    ),
  );
}

double valofDouble(int? val) {
  final myDouble = val! > 100
      ? 99 / pow(10, 99.toString().length)
      : val / pow(10, val.toString().length);
  return myDouble;
}
