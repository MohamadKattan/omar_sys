import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omar_system/app_info.dart';

TextStyle tajawalDarkTheme =
    const TextStyle(color: Colors.white, fontFamily: 'Tajawal');
TextStyle tajawalTheme =
    const TextStyle(color: Colors.black, fontFamily: 'Tajawal');

ThemeData darkTheme(context) {
  return ThemeData(
    // colorScheme: colorScheme.copyWith(primary: Colors.amber),

    primaryColorDark: $mainDarkColor,
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: $mainDarkColor),
    primaryColor: $mainDarkColor,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.highContrastDark(
        primary: $mainDarkColor, brightness: Brightness.dark),
    appBarTheme: appBarTheme(context),
    textTheme: TextTheme(
      bodyLarge: tajawalDarkTheme,
      bodyMedium: tajawalDarkTheme,
      displayLarge: tajawalDarkTheme,
      displayMedium: tajawalDarkTheme,
      displaySmall: tajawalDarkTheme,
      headlineMedium: tajawalDarkTheme,
      headlineSmall: tajawalDarkTheme,
      titleLarge: tajawalDarkTheme,
      titleMedium: tajawalDarkTheme,
      titleSmall: tajawalDarkTheme,
      bodySmall: tajawalDarkTheme,
      labelLarge: tajawalDarkTheme,
      labelSmall: tajawalDarkTheme,
    ),
  );
}

ThemeData theme(context) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: $mainColor),
    colorScheme: const ColorScheme.highContrastDark(
        primary: $mainColor, brightness: Brightness.light),
    appBarTheme: appBarTheme(context),
    textTheme: TextTheme(
      bodyLarge: tajawalTheme,
      bodyMedium: tajawalTheme,
      displayLarge: tajawalTheme,
      displayMedium: tajawalTheme,
      displaySmall: tajawalTheme,
      headlineMedium: tajawalTheme,
      headlineSmall: tajawalTheme,
      titleLarge: tajawalTheme,
      titleMedium: tajawalTheme,
      titleSmall: tajawalTheme,
      bodySmall: tajawalTheme,
      labelLarge: tajawalTheme,
      labelSmall: tajawalTheme,
    ),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: $textColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    // labelStyle: TextStyle(fontSize: 15),
    hintStyle: const TextStyle(fontSize: 15),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

AppBarTheme appBarTheme(context) {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.black),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    toolbarTextStyle: const TextTheme(
      titleLarge: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ).bodyMedium,
    titleTextStyle: const TextTheme(
      titleLarge: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ).titleLarge,
  );
}
 // radio
//
// qus = [
// id => id answer,
// id => [
// id answer,
//     id answer
// ]
// ]