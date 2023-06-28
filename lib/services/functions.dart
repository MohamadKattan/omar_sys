// ignore_for_file: unused_local_variable

import 'dart:io' show Platform;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'local_database.dart';

final functions = Functions();

class Functions {
  Future<Locale?> fetchLocale() async {
    if (dataBase.getLanguageCode != null) {
      String languageCode = dataBase.getLanguageCode;
      String countryCode = dataBase.getCountryCode;

      return Locale(languageCode, countryCode);
    }
    return null;
  }

  Future<bool> tokenState() async {
    if (dataBase.getToken != null) {
      return true;
    }
    return false;
  }
  Future<ThemeMode> themeMode() async {
    if (dataBase.getThemeMood != null) {
      String mode = dataBase.getThemeMood;
      ThemeMode themeMode;
      if(mode == 'ThemeMode.dark'){
         themeMode = ThemeMode.dark;

      }else if (mode == 'ThemeMode.light'){
        themeMode = ThemeMode.light;
      }
      else {
        themeMode = ThemeMode.system;
      }
      return themeMode;
    }
    return ThemeMode.system;
  }

  Future<bool> isDarkMode(context) async {
    Brightness brightness = MediaQuery.platformBrightnessOf(context);
    bool darkMode = brightness == Brightness.dark;

    return darkMode;
  }

  darkMode(context)  {
    Brightness brightness = MediaQuery.platformBrightnessOf(context);
    bool darkMode = brightness == Brightness.dark;

    return darkMode;
  }

  getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    String? deviceName;

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceName = androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceName = iosInfo.utsname.machine;
    } else {
      deviceName = 'Windows or Web';
    }
    return deviceName;
  }

  String getDateString(String date) {
    var dateTime2 = DateFormat('yyyy-m-d').parse(date);
    var newFormat = DateFormat("yyyy-m-d");
    String updatedDt = newFormat.format(dateTime2);
    return updatedDt;
  }

  String getDateTimeString(String date) {
    var dateTime2 = DateFormat('yyyy-MM-ddTHH:mm:ss').parse(date);
    var newFormat = DateFormat("h:mm a");
    String updatedDt = newFormat.format(dateTime2);
    return updatedDt;
  }

  String getDateDayString(String date) {
    if (kDebugMode) {
      print(date.toString());
    }
    var dateTime2 = DateFormat('yyyy-m-d').parse(date);
    var newFormat = DateFormat("d");
    String updatedDt = newFormat.format(dateTime2);
    return date;
  }

  String getDateMonthString(String date) {
    var dateTime2 = DateFormat('yyyy-m-d').parse(date);
    var newFormat = DateFormat("MMM");
    String updatedDt = newFormat.format(dateTime2);
    return updatedDt;
  }

  String getDateYearString(String date) {
    var dateTime2 = DateFormat('yyyy-m-d').parse(date);
    var newFormat = DateFormat("yyyy");
    String updatedDt = newFormat.format(dateTime2);
    return updatedDt;
  }

}
