import 'package:flutter/material.dart';

const animationDuration = Duration(milliseconds: 200);

const headingStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp nameValidatorRegExp = RegExp(r"#\p{L}+([_]+\p{L}+)+");
final RegExp numberValidatorRegExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,11,12}$)');
final urlRegExp = RegExp(
    r"^((http|ftp|https):\/\/)?([\w_-]+(?:(?:\.[\w_-]+)+))([\w.,@?^=%&:\/~+#-]*[\w@?^=%&\/~+#-])?");


// final otpInputDecoration = InputDecoration(
//   contentPadding:
//   const EdgeInsets.symmetric(vertical: 15),
//   border: outlineInputBorder(),
//   focusedBorder: outlineInputBorder(),
//   enabledBorder: outlineInputBorder(),
// );

// OutlineInputBorder outlineInputBorder() {
//   return OutlineInputBorder(
//     borderRadius: BorderRadius.circular(15),
//     borderSide:  BorderSide(color: checkDarkTheme(context.m)  ? $mainDarkColor : $mainColor),
//   );
// }
