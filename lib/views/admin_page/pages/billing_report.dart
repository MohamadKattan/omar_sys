import 'package:flutter/material.dart';
import 'package:omar_system/app_info.dart';
import 'package:omar_system/services/provider.dart';
import 'package:omar_system/size_config.dart';
import 'package:omar_system/views/admin_page/componen/custom_text.dart';
import 'package:provider/provider.dart';

Widget billingReportPage(BuildContext context) {
  final valLisner = context.read<ProviderListiner>();
  return SingleChildScrollView(
    child: Container(
      constraints: const BoxConstraints(maxWidth: 650),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: screenHeightMultiply(0.01, context)),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.grey.shade300,
            ),
            child: customText(
                text: context.t!.bill,
                fSize: 24.0,
                color: checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
                fWeight: FontWeight.bold),
          ),
          SizedBox(height: screenHeightMultiply(0.01, context)),
          // ========By Registered section =============
          Container(
            margin: const EdgeInsets.all(12.0),
            constraints: const BoxConstraints(maxWidth: 650),
            decoration: BoxDecoration(
              color: checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
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
            child: Container(
              margin: const EdgeInsets.only(top: 30.0),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  customText(
                      text: context.t!.byRegistered,
                      color: Colors.orange.shade400,
                      fSize: 18,
                      fWeight: FontWeight.bold),
                  SizedBox(height: screenHeightMultiply(0.02, context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          customText(
                            text: context.t!.talNumberReg,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: valLisner.attendreport.totalnumberReg
                                .toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          customText(
                            text: context.t!.totalNumberRegPaid,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: valLisner.attendreport.totalnumberRegPaid
                                .toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          customText(
                            text: context.t!.totalNumberRegUnPaid,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: valLisner.attendreport.totalnumberRegUnPaid
                                .toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeightMultiply(0.01, context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          customText(
                            text: context.t!.totalCancel,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: valLisner.attendreport.totalCancel.toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          customText(
                            text: context.t!.totalPending,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text:
                                valLisner.attendreport.totalPanding.toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          customText(
                            text: context.t!.totalActive,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: valLisner.attendreport.totalActive.toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // ========TOTAL STATEMENT=====================
          Container(
            margin: const EdgeInsets.all(12.0),
            constraints: const BoxConstraints(maxWidth: 650),
            decoration: BoxDecoration(
              color: checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
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
            child: Container(
              margin: const EdgeInsets.only(top: 30.0),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  customText(
                      text: context.t!.totalStata,
                      color: Colors.orange.shade400,
                      fSize: 24,
                      fWeight: FontWeight.bold),
                  SizedBox(height: screenHeightMultiply(0.03, context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          customText(
                            text: context.t!.totalAm,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: valLisner.attendreport.totalAmountState
                                .toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          customText(
                            text: context.t!.paid,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: valLisner.attendreport.totalPaidState
                                .toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          customText(
                            text: context.t!.remainin,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: valLisner.attendreport.totalRemainingSatate
                                .toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeightMultiply(0.06, context)),
                ],
              ),
            ),
          ),
          // ==================Revenue ==================
          Container(
            margin: const EdgeInsets.all(12.0),
            constraints: const BoxConstraints(maxWidth: 650),
            decoration: BoxDecoration(
              color: checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
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
            child: Container(
              margin: const EdgeInsets.only(top: 30.0),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  customText(
                      text: context.t!.revenue,
                      color: Colors.orange.shade400,
                      fSize: 24,
                      fWeight: FontWeight.bold),
                  SizedBox(height: screenHeightMultiply(0.03, context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          customText(
                            text: context.t!.payCollection,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: 'Not!!;)'.toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          customText(
                            text: context.t!.netIncome,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: valLisner.attendreport.netIncome.toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeightMultiply(0.06, context)),
                ],
              ),
            ),
          ),
          // ==================Summery==================
          Container(
            margin: const EdgeInsets.all(12.0),
            constraints: const BoxConstraints(maxWidth: 650),
            decoration: BoxDecoration(
              color: checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
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
            child: Container(
              margin: const EdgeInsets.only(top: 30.0),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  customText(
                      text: context.t!.summary,
                      color: Colors.orange.shade400,
                      fSize: 24,
                      fWeight: FontWeight.bold),
                  SizedBox(height: screenHeightMultiply(0.03, context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          customText(
                            text: context.t!.nofRegistration,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: valLisner.attendreport.totalnumberReg
                                .toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          customText(
                            text: context.t!.nofCancellation,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: valLisner.attendreport.nOfCancel.toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeightMultiply(0.03, context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          customText(
                            text: context.t!.theAmountValue,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: valLisner.attendreport.totalnumberReg
                                .toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          customText(
                            text: context.t!.theAmountValueCan,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text:
                                valLisner.attendreport.cancellation.toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeightMultiply(0.03, context)),
                ],
              ),
            ),
          ),
          // ======Balance Of Remaining (with filter) =====
          Container(
            margin: const EdgeInsets.all(12.0),
            constraints: const BoxConstraints(maxWidth: 650),
            decoration: BoxDecoration(
              color: checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
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
            child: Container(
              margin: const EdgeInsets.only(top: 30.0),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  customText(
                      text: context.t!.balOfRemainin,
                      color: Colors.orange.shade400,
                      fSize: 24,
                      fWeight: FontWeight.bold),
                  SizedBox(height: screenHeightMultiply(0.03, context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          customText(
                            text: context.t!.nOfCustomer,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: valLisner.attendreport.nOfCustome.toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          customText(
                            text: context.t!.balanceValue,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text:
                                valLisner.attendreport.balanceValue.toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeightMultiply(0.06, context)),
                ],
              ),
            ),
          ),
          // ======Balance Of Remaining (with out filter) =====
          Container(
            margin: const EdgeInsets.all(12.0),
            constraints: const BoxConstraints(maxWidth: 650),
            decoration: BoxDecoration(
              color: checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
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
            child: Container(
              margin: const EdgeInsets.only(top: 30.0),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  customText(
                      text: context.t!.balOfRemaininNoFil,
                      color: Colors.orange.shade400,
                      fSize: 24,
                      fWeight: FontWeight.bold),
                  SizedBox(height: screenHeightMultiply(0.03, context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          customText(
                            text: context.t!.nOfCustomer,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: valLisner.attendreport.nOfCustomeNoFilter
                                .toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          customText(
                            text: context.t!.balanceValue,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: valLisner.attendreport.balanceValueNoFilter
                                .toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeightMultiply(0.06, context)),
                ],
              ),
            ),
          ),
          // ======Balance Of Cancellation (Total without filter) =====
          Container(
            margin: const EdgeInsets.all(12.0),
            constraints: const BoxConstraints(maxWidth: 650),
            decoration: BoxDecoration(
              color: checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
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
            child: Container(
              margin: const EdgeInsets.only(top: 30.0),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  customText(
                      text: context.t!.balOfCancelNoFil,
                      color: Colors.orange.shade400,
                      fSize: 24,
                      fWeight: FontWeight.bold),
                  SizedBox(height: screenHeightMultiply(0.03, context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          customText(
                            text: context.t!.nOfCustomer,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: valLisner.attendreport.nOfCustomerNoFilterCan
                                .toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          customText(
                            text: context.t!.balanceValue,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: valLisner.attendreport.balanceValueNoFilterCan
                                .toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeightMultiply(0.06, context)),
                ],
              ),
            ),
          ),
          // =================callac====================================
          Container(
            margin: const EdgeInsets.all(12.0),
            constraints: const BoxConstraints(maxWidth: 650),
            decoration: BoxDecoration(
              color: checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
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
            child: Container(
              margin: const EdgeInsets.only(top: 30.0),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  customText(
                      text: '---',
                      color: Colors.orange.shade400,
                      fSize: 24,
                      fWeight: FontWeight.bold),
                  SizedBox(height: screenHeightMultiply(0.03, context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          customText(
                            text: context.t!.amountCancel,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text:
                                valLisner.attendreport.cancellation.toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          customText(
                            text: context.t!.amountPending,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text:
                                valLisner.attendreport.totalPanding.toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          customText(
                            text: context.t!.netIncome,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: valLisner.attendreport.netIncome.toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeightMultiply(0.06, context)),
                ],
              ),
            ),
          ),
          // =============The total number of payments due===============
          Container(
            margin: const EdgeInsets.all(12.0),
            constraints: const BoxConstraints(maxWidth: 650),
            decoration: BoxDecoration(
              color: checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
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
            child: Container(
              margin: const EdgeInsets.only(top: 30.0),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  customText(
                      text: context.t!.paymentsDue,
                      color: Colors.orange.shade400,
                      fSize: 24,
                      fWeight: FontWeight.bold),
                  SizedBox(height: screenHeightMultiply(0.03, context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          customText(
                            text: context.t!.totalNumber,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: valLisner.attendreport.thetotalNumber
                                .toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          customText(
                            text: context.t!.totatFday,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: valLisner.attendreport.totalForTheDay
                                .toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeightMultiply(0.06, context)),
                ],
              ),
            ),
          ),
          // =============By number of Order===============
          Container(
            margin: const EdgeInsets.all(12.0),
            constraints: const BoxConstraints(maxWidth: 650),
            decoration: BoxDecoration(
              color: checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
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
            child: Container(
              margin: const EdgeInsets.only(top: 30.0),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  customText(
                      text: context.t!.numberOfOrder,
                      color: Colors.orange.shade400,
                      fSize: 24,
                      fWeight: FontWeight.bold),
                  SizedBox(height: screenHeightMultiply(0.03, context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          customText(
                            text: context.t!.totalOrderPaid,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: valLisner.attendreport.totalNumberOrderPaid
                                .toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          customText(
                            text: context.t!.totalNumberOrderRemaining,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: valLisner
                                .attendreport.totalNumberOrderRemaining
                                .toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeightMultiply(0.06, context)),
                ],
              ),
            ),
          ),
          //=============by agaents=====================
          SizedBox(height: screenHeightMultiply(0.01, context)),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.grey.shade300,
            ),
            child: customText(
                text: context.t!.byAgents,
                fSize: 24.0,
                color: checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
                fWeight: FontWeight.bold),
          ),
          SizedBox(height: screenHeightMultiply(0.01, context)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 30 / 100,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: valLisner.listUsersAttends.length,
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
                  child: Container(
                    margin: const EdgeInsets.only(top: 30.0),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customText(
                              text:
                                  "${i + 1}_ ${valLisner.listUsersAttends[i].name}",
                              color: Colors.orange.shade400,
                              fSize: 24,
                              fWeight: FontWeight.bold),
                        ),
                        SizedBox(height: screenHeightMultiply(0.03, context)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                customText(
                                  text: context.t!.totalAm,
                                  color: checkDarkTheme(context.m)
                                      ? $mainColor
                                      : $mainLightColor,
                                ),
                                customText(
                                  text: valLisner
                                      .listUsersAttends[i].totalAmount
                                      .toString(),
                                  color: checkDarkTheme(context.m)
                                      ? $mainColor
                                      : $mainLightColor,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                customText(
                                  text: context.t!.totalRemAg,
                                  color: checkDarkTheme(context.m)
                                      ? $mainColor
                                      : $mainLightColor,
                                ),
                                customText(
                                  text: valLisner
                                      .listUsersAttends[i].totalRemaining
                                      .toString(),
                                  color: checkDarkTheme(context.m)
                                      ? $mainColor
                                      : $mainLightColor,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                customText(
                                  text: context.t!.totalPaidA,
                                  color: checkDarkTheme(context.m)
                                      ? $mainColor
                                      : $mainLightColor,
                                ),
                                customText(
                                  text: valLisner.listUsersAttends[i].totalPaid
                                      .toString(),
                                  color: checkDarkTheme(context.m)
                                      ? $mainColor
                                      : $mainLightColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeightMultiply(0.06, context)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
