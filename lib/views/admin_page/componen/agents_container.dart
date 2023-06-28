// this widget include agent info + his work info
import 'package:flutter/material.dart';

import '../../../app_info.dart';
import '../../../models/admin_report.dart';
import '../../../size_config.dart';
import 'custom_text.dart';

Widget agentCustomeContainer(
    int i, List<AgentAdminReport> listOfAgent, BuildContext context) {
  final double imageHeight = screenHeightMultiply(0.15, context);
  return Container(
      margin: const EdgeInsets.all(12.0),
      constraints: const BoxConstraints(maxWidth: 650),
      // padding: EdgeInsets.symmetric(
      //     horizontal: screenWidthMultiply(0.10, context)),
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
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                listOfAgent[i].imageUrl?.imageSm != null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: imageHeight / 4,
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(
                              listOfAgent[i].imageUrl?.original ?? ''),
                        ),
                      )
                    : const CircleAvatar(
                        radius: 25.0,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person)),
                customText(
                    text: listOfAgent[i].name,
                    fWeight: FontWeight.bold,
                    color:
                        checkDarkTheme(context.m) ? $mainColor : $mainDarkColor,
                    fSize: 18.0)
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 30.0),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeightMultiply(0.04, context)),
                  customText(
                      text: context.t!.generalInformation,
                      color: Colors.orange.shade400,
                      fSize: 18,
                      fWeight: FontWeight.bold),
                  SizedBox(height: screenHeightMultiply(0.01, context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          customText(
                            text: context.t!.todayFollowUp,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: listOfAgent[i]
                                    .listDayFollow
                                    ?.length
                                    .toString() ??
                                '',
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          customText(
                            text: context.t!.pandingCalls,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: listOfAgent[i].pending_calls.toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          customText(
                            text: context.t!.waitingForYourCall,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text:
                                listOfAgent[i].waiting_for_your_call.toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          customText(
                            text: context.t!.numberOfReg,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: listOfAgent[i].number_of_reg.toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeightMultiply(0.01, context)),
                  customText(
                      text: context.t!.phoneStatus,
                      color: Colors.orange.shade400,
                      fSize: 18,
                      fWeight: FontWeight.bold),
                  SizedBox(height: screenHeightMultiply(0.01, context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          customText(
                            text: context.t!.blanks,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: listOfAgent[i].phone_status_blank.toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          customText(
                            text: context.t!.answerd,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: listOfAgent[i].phone_status_answer.toString(),
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          customText(
                            text: context.t!.notReached,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: listOfAgent[i]
                                .phone_status_not_reached
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
                            text: context.t!.closed,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                              text:
                                  listOfAgent[i].phone_status_closed.toString(),
                              color: checkDarkTheme(context.m)
                                  ? $mainColor
                                  : $mainLightColor),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeightMultiply(0.01, context)),
                  customText(
                      text: context.t!.customerStatus,
                      color: Colors.orange.shade400,
                      fSize: 18,
                      fWeight: FontWeight.bold),
                  SizedBox(height: screenHeightMultiply(0.01, context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          customText(
                            text: context.t!.pendingHasFollowUp,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: listOfAgent[i]
                                .customer_status_pending
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
                            text: context.t!.interestedHasFollowUp,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: listOfAgent[i]
                                .customer_status_interested
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
                            text: context.t!.wrongNumber,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: listOfAgent[i]
                                .customer_status_wrong_number
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
                            text: context.t!.blanks,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: listOfAgent[i]
                                .customer_status_blanks
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
                  customText(
                      text: context.t!.finalResults,
                      color: Colors.orange.shade400,
                      fSize: 18,
                      fWeight: FontWeight.bold),
                  SizedBox(height: screenHeightMultiply(0.01, context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          customText(
                            text: context.t!.reserved,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                              text: listOfAgent[i]
                                  .final_results_reserved
                                  .toString(),
                              color: checkDarkTheme(context.m)
                                  ? $mainColor
                                  : $mainLightColor),
                        ],
                      ),
                      Column(
                        children: [
                          customText(
                            text: context.t!.interview,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: listOfAgent[i]
                                .final_results_reserved_interview
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
                            text: context.t!.pendingApproval,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                            text: listOfAgent[i]
                                .final_results_pending_approval
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
                            text: context.t!.noCallAgain,
                            color: checkDarkTheme(context.m)
                                ? $mainColor
                                : $mainLightColor,
                          ),
                          customText(
                              text: listOfAgent[i]
                                  .final_results_dont_call_again
                                  .toString(),
                              color: checkDarkTheme(context.m)
                                  ? $mainColor
                                  : $mainLightColor),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ));
}
