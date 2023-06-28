// fillter  open dailoge
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:omar_system/views/admin_page/componen/custom_dropbtn.dart';
import 'package:provider/provider.dart';

import '../../../app_info.dart';
import '../../../services/databasehelper.dart';
import '../../../services/provider.dart';
import '../../../size_config.dart';
import '../../../widgets/main_button.dart';
import 'custom_text.dart';

Widget openFillterDailoge(BuildContext context, int? indexCatId) {
  return Dialog(
    alignment: Alignment.center,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
    backgroundColor: Colors.black.withOpacity(0.5),
    elevation: 0.6,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.close_sharp,
                    color: Colors.red,
                    size: 30.0,
                  )),
            ),
            Column(
              children: [
                SizedBox(height: screenHeightMultiply(0.01, context)),
                customText(
                    text: context.t!.fillterDsc,
                    fSize: 20,
                    fWeight: FontWeight.bold),
                SizedBox(height: screenHeightMultiply(0.01, context)),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  margin: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(4.0)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Consumer<ProviderListiner>(
                        builder: (_, val, child) {
                          return customText(
                              text:
                                  '${context.t!.startDate} : ${val.startDate ?? 'yyyy-mm-dd'}',
                              fSize: 20,
                              fWeight: FontWeight.w500);
                        },
                      ),
                      _dailogePickDate(isStartdate: true, context: context)
                    ],
                  ),
                ),
                SizedBox(height: screenHeightMultiply(0.01, context)),
                Container(
                  margin: const EdgeInsets.all(4.0),
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(4.0)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Consumer<ProviderListiner>(
                        builder: (_, val, child) {
                          return customText(
                              text:
                                  '${context.t!.endDate} : ${val.endDate ?? 'yyyy-mm-dd'}',
                              fSize: 20,
                              fWeight: FontWeight.w500);
                        },
                      ),
                      _dailogePickDate(isStartdate: false, context: context)
                    ],
                  ),
                ),
                SizedBox(height: screenHeightMultiply(0.01, context)),
                Consumer<ProviderListiner>(
                  builder: (_, val, child) {
                    return customDropButton(
                      dropdownValue: val.valChange ?? val.lisOfTitleCat.first,
                      list: val.lisOfTitleCat,
                      function: (String? valueChange) {
                        if (valueChange != null) {
                          val.updatechangeVal(valueChange);
                          indexCatId = val.lisOfTitleCat
                              .indexWhere((element) => element == valueChange);
                        }
                      },
                    );
                  },
                ),
                SizedBox(height: screenHeightMultiply(0.04, context)),
                MainButton(
                    text: context.t!.filterData,
                    function: () async {
                      await checkBeforFillter(context, indexCatId);
                    },
                    btnColor:
                        checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
                    fontColor: Colors.white),
                SizedBox(height: screenHeightMultiply(0.04, context)),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

// this dailoge for pick date
Widget _dailogePickDate(
    {required bool isStartdate, required BuildContext context}) {
  const dayTextStyle =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w700);
  final weekendTextStyle =
      TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w600);
  final anniversaryTextStyle = TextStyle(
    color: Colors.red[400],
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
  );
  final config = CalendarDatePicker2WithActionButtonsConfig(
    dayTextStyle: dayTextStyle,
    calendarType: CalendarDatePicker2Type.range,
    selectedDayHighlightColor: const Color.fromARGB(255, 221, 118, 22),
    yearTextStyle: const TextStyle(
      color: Color.fromARGB(255, 50, 41, 41),
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
    closeDialogOnCancelTapped: true,
    firstDayOfWeek: 1,
    weekdayLabelTextStyle: const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
    ),
    controlsTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
    centerAlignModePicker: true,
    customModePickerIcon: const SizedBox(),
    selectedDayTextStyle: dayTextStyle.copyWith(color: Colors.white),
    dayTextStylePredicate: ({required date}) {
      TextStyle? textStyle;
      if (date.weekday == DateTime.saturday ||
          date.weekday == DateTime.sunday) {
        textStyle = weekendTextStyle;
      }
      if (DateUtils.isSameDay(date, DateTime(2021, 1, 25))) {
        textStyle = anniversaryTextStyle;
      }
      return textStyle;
    },
    dayBuilder: ({
      required date,
      textStyle,
      decoration,
      isSelected,
      isDisabled,
      isToday,
    }) {
      Widget? dayWidget;
      if (date.day % 3 == 0 && date.day % 9 != 0) {
        dayWidget = Container(
          decoration: decoration,
          child: Center(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Text(
                  MaterialLocalizations.of(context).formatDecimal(date.day),
                  style: textStyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 27.5),
                  child: Container(
                    height: 4,
                    width: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color:
                          isSelected == true ? Colors.white : Colors.grey[500],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
      return dayWidget;
    },
    yearBuilder: ({
      required year,
      decoration,
      isCurrentYear,
      isDisabled,
      isSelected,
      textStyle,
    }) {
      return Center(
        child: Container(
          decoration: decoration,
          height: 36,
          width: 72,
          child: Center(
            child: Semantics(
              selected: isSelected,
              button: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    year.toString(),
                    style: textStyle,
                  ),
                  if (isCurrentYear == true)
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(left: 5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.redAccent,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
  return CircleAvatar(
    radius: 20,
    backgroundColor: Colors.orange.shade300,
    child: IconButton(
        onPressed: () async {
          final values = await showCalendarDatePicker2Dialog(
            context: context,
            config: config,
            dialogSize: const Size(325, 400),
            borderRadius: BorderRadius.circular(15),
            value: context.read<ProviderListiner>().listOfDate,
            dialogBackgroundColor: Colors.white,
          );
          if (values != null) {
            if (isStartdate) {
              if (context.mounted) {
                context
                    .read<ProviderListiner>()
                    .updateStartDate(_formatDate(values));
              }
            } else {
              if (context.mounted) {
                context
                    .read<ProviderListiner>()
                    .updateEndDATE(_formatDate(values));
              }
            }
            if (context.mounted) {
              context.read<ProviderListiner>().updateListOfDate(values);
            }
          }
        },
        icon: const Icon(
          Icons.date_range,
          color: Colors.black,
        )),
  );
}

// this method for format date befor set to api
String _formatDate(List<DateTime?> values) {
  String valueText = '';
  if (values.isNotEmpty) {
    values =
        values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
    valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');
  } else {
    return 'null';
  }

  return valueText;
}

// this method for check if val date and section not null befor request fillter
Future checkBeforFillter(BuildContext context, int? indexCatId) async {
  final val = context.read<ProviderListiner>();
  if (val.startDate == null) {
    errorMessgae(context.t!.startDateReq);
  } else if (val.endDate == null) {
    errorMessgae(context.t!.endDateReq);
  } else if (val.valChange == null) {
    errorMessgae(context.t!.category);
  } else {
    await databaseHelper.adminCallRecordReport(context,
        isFiltter: true,
        startAt: context.read<ProviderListiner>().startDate,
        endAt: context.read<ProviderListiner>().endDate,
        catId: context.read<ProviderListiner>().lisOfIdCat[indexCatId ?? 1]);
    if (context.mounted) {
      Navigator.pop(context);
    }
  }
}

void errorMessgae(String? errorMessgae) {
  Fluttertoast.showToast(
      msg: errorMessgae ?? 'Errore',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
