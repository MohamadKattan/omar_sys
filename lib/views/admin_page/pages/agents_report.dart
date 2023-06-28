// list if agents reports work info
import 'package:flutter/material.dart';
import 'package:omar_system/app_info.dart';
import 'package:provider/provider.dart';

import '../../../services/provider.dart';
import '../../../size_config.dart';
import '../../home_page/components/home_shimmer.dart';
import '../componen/agents_container.dart';
import '../componen/custom_text.dart';

Widget agentsReportsPage(BuildContext context) {
  return Consumer<ProviderListiner>(
    builder: (BuildContext context, value, Widget? child) {
      if (value.listOfAgent.isNotEmpty) {
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
                  text: context.t!.agentsReport,
                  fSize: 24.0,
                  color:
                      checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
                  fWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeightMultiply(0.01, context)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 65 / 100,
              child: ListView.builder(
                itemCount: value.listOfAgent.length,
                itemBuilder: (_, i) {
                  return agentCustomeContainer(i, value.listOfAgent, context);
                },
              ),
            ),
          ],
        );
      } else {
        return SizedBox(
          child: ListView(
            children: const [
              HomeShimmer(),
            ],
          ),
        );
      }
    },
  );
}
