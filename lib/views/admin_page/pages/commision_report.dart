// this widget for display data from commision api

import 'package:flutter/material.dart';
import 'package:omar_system/models/admin_commision.dart';
import 'package:omar_system/services/provider.dart';
import 'package:omar_system/views/admin_page/componen/custom_text.dart';
import 'package:omar_system/views/admin_page/componen/totle_container.dart';
import 'package:provider/provider.dart';

import '../../../app_info.dart';
import '../../../size_config.dart';

Widget commisionReport(BuildContext context) {
  final vallisner = context.read<ProviderListiner>().commsionsEndOfResult;
  return Column(
    children: [
      SizedBox(height: screenHeightMultiply(0.02, context)),
      Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey.shade300,
        ),
        child: customText(
            text: context.t!.mCommision,
            fSize: 24.0,
            color: checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
            fWeight: FontWeight.bold),
      ),
      SizedBox(height: screenHeightMultiply(0.01, context)),
      SizedBox(
        height: MediaQuery.of(context).size.height * 65 / 100,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: vallisner.length,
          itemBuilder: (_, i) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: customeTotleContainer(
                context: context,
                title: vallisner[i].agentName ?? "null",
                txt1: context.t!.commisionThisM,
                val1: '${vallisner[i].commisionMonth ?? "null"} (\$)',
                txt2: context.t!.exCommision,
                val2: '${vallisner[i].expextedcommision} (\$)',
                txt3: context.t!.commisionReservation,
                val3: '${vallisner[i].totleCount}',
                txt4: context.t!.commisionFull,
                val4: '${calc(vallisner, i)}',
                txt5: context.t!.commisionRemaining,
                val5: '${vallisner[i].remainingCount}',
              ),
            );
          },
        ),
      ),
    ],
  );
}

int calc(List<CommsionsEndOfResult> vallisner, int i) {
  return vallisner[i].totleCount! - vallisner[i].remainingCount!;
}
