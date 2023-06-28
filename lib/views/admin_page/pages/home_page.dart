// home page
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../../app_info.dart';
import '../../../services/provider.dart';
import '../../../size_config.dart';
import '../../../widgets/home_routes_btn.dart';
import '../componen/custom_text.dart';
import '../componen/totle_container.dart';

Widget homePage(BuildContext context, PageController? controllerView) {
  final dataAllReport = context.watch<ProviderListiner>().allReportInfo;
  return SingleChildScrollView(
    child: Container(
      constraints: const BoxConstraints(maxWidth: 650),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: screenHeightMultiply(0.03, context)),
          sayGoodMorming(context),
          SizedBox(height: screenHeightMultiply(0.03, context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HomeRoutesBtn(
                icon: Iconsax.profile_2user,
                title: context.t!.agentsAdmin,
                func: () {
                  context.read<ProviderListiner>().updateInedxOfPageView(1);
                  controllerView?.animateToPage(
                      context.read<ProviderListiner>().indexPageView,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                },
              ),
              HomeRoutesBtn(
                icon: Icons.attach_money,
                title: context.t!.bill,
                func: () {
                  context.read<ProviderListiner>().updateInedxOfPageView(2);
                  controllerView?.animateToPage(
                      context.read<ProviderListiner>().indexPageView,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HomeRoutesBtn(
                icon: Icons.monetization_on,
                title: context.t!.commision,
                func: () {
                  context.read<ProviderListiner>().updateInedxOfPageView(3);
                  controllerView?.animateToPage(
                      context.read<ProviderListiner>().indexPageView,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                },
              ),
              HomeRoutesBtn(
                icon: Iconsax.call,
                title: context.t!.navEffort,
                func: () {
                    context.read<ProviderListiner>().updateInedxOfPageView(4);
                  controllerView?.animateToPage(
                      context.read<ProviderListiner>().indexPageView,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                },
              ),
            ],
          ),
          SizedBox(height: screenHeightMultiply(0.03, context)),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.grey.shade300,
            ),
            child: customText(
                text: context.t!.total,
                fSize: 24.0,
                color: checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
                fWeight: FontWeight.bold),
          ),
          SizedBox(height: screenHeightMultiply(0.02, context)),
          customeTotleContainer(
              title: context.t!.generalInformation,
              txt1: context.t!.todayFollowUp,
              val1: dataAllReport.dayFollowse?.length.toString() ?? '',
              txt2: context.t!.pandingCalls,
              val2: dataAllReport.follow.toString(),
              txt3: context.t!.waitingForYourCall,
              val3: dataAllReport.answerd2.toString(),
              txt4: context.t!.numberOfReg,
              val4: dataAllReport.numberOfReg.toString(),
              context: context),
          SizedBox(height: screenHeightMultiply(0.03, context)),
          customeTotleContainer(
              title: context.t!.phoneStatus,
              txt1: context.t!.answerd,
              val1: dataAllReport.answerd.toString(),
              txt2: context.t!.notReached,
              val2: dataAllReport.notReached.toString(),
              txt3: context.t!.closed,
              val3: dataAllReport.closed.toString(),
              context: context),
          SizedBox(height: screenHeightMultiply(0.03, context)),
          customeTotleContainer(
              title: context.t!.customerStatus,
              txt1: context.t!.blanks,
              val1: dataAllReport.followupnum.toString(),
              txt4: context.t!.pendingHasFollowUp,
              val4: dataAllReport.follow.toString(),
              txt3: context.t!.changedHisMind,
              val3: dataAllReport.changedHisMind.toString(),
              txt2: context.t!.wrongNumber.toString(),
              val2: dataAllReport.wrongNumber.toString(),
              txt5: context.t!.interestedHasFollowUp,
              val5: dataAllReport.interested.toString(),
              context: context),
          SizedBox(height: screenHeightMultiply(0.03, context)),
          customeTotleContainer(
              title: context.t!.finalResults,
              txt1: context.t!.reserved,
              val1: dataAllReport.reserved.toString(),
              txt2: context.t!.interview,
              val2: dataAllReport.interview.toString(),
              txt3: context.t!.pendingApproval,
              val3: dataAllReport.pendingApproval.toString(),
              txt4: context.t!.noCallAgain.toString(),
              val4: dataAllReport.dontCall.toString(),
              txt5: context.t!.database,
              val5: dataAllReport.database.toString(),
              context: context),
          SizedBox(height: screenHeightMultiply(0.05, context)),
        ],
      ),
    ),
  );
}

// ===========say good Morning or evening===========
String greeting(BuildContext context) {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return context.t!.goodM;
  }
  return context.t!.goodE;
}

IconData greetingIcons() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return Icons.sunny;
  }
  if (hour < 17) {
    return Icons.sunny_snowing;
  }
  return Icons.nights_stay_outlined;
}

ColorSwatch<int> greetingIconsColors() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return Colors.yellow;
  }
  if (hour < 17) {
    return Colors.yellow;
  }
  return Colors.grey;
}

Widget sayGoodMorming(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customText(
            text: '${DateTime.now()}'.substring(0, 10),
            fSize: 20,
            color: checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
            fWeight: FontWeight.bold),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: customText(
                  text: "${greeting(context)}\n Admin",
                  fSize: 18,
                  color:
                      checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
                  fWeight: FontWeight.bold),
            ),
            Icon(
              greetingIcons(),
              color: greetingIconsColors(),
              size: 40,
            ),
          ],
        ),
      ],
    ),
  );
}
//===================================================
