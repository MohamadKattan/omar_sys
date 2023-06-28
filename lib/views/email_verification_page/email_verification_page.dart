import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../../app_info.dart';
import '../../size_config.dart';
import 'components/body.dart';

class EmailVerificationPage extends StatelessWidget {
  final String? email;
  static String routeName = "/email_verification_page";

  const EmailVerificationPage({Key? key, this.email}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            context.t!.forgetYourPassword,
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
        body: Body(
          email: email!,
        ),
      ),
    );
  }
}
