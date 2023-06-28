import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../../app_info.dart';
import '../../size_config.dart';
import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  const SignUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            context.t!.newAccount,
            style: TextStyle(
                color: Colors.white, fontSize: screenWidthDivided(25, context)),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor:
              checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          toolbarTextStyle: GoogleFonts.tajawalTextTheme(
            Theme.of(context).textTheme,
          ).bodyMedium,
          titleTextStyle: GoogleFonts.tajawalTextTheme(
            Theme.of(context).textTheme,
          ).titleLarge,
        ),
        body: const Body(),
      ),
    );
  }
}
