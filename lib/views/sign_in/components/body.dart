import 'package:flutter/material.dart';
import 'package:omar_system/app_info.dart';
import '../../../size_config.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints:
            const BoxConstraints(
                maxWidth: 650 ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidthMultiply(0.10, context)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeightMultiply(0.05, context)),
                    Center(
                        child: Image.asset(
                          checkDarkTheme(context.m)  ? 'assets/images/logo-w.png' : 'assets/images/logo.png',
                          fit: BoxFit.contain,
                          height: screenHeightMultiply(0.08, context),
                        )),
                    SizedBox(height: screenHeightMultiply(0.05, context)),

                    Text(
                      context.t!.welcomeAgain,
                      style: TextStyle(
                        color: checkDarkTheme(context.m)  ? $textDarkColor : $textColor ,
                        fontSize: screenWidthDivided(15, context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeightMultiply(0.03, context)),
                    Text(context.t!.welcomeAgainDes,
                        textAlign: TextAlign.center,
                        style:  TextStyle(height: 1.8,
                          fontSize: screenWidthDivided(28, context),
                        )),
                    SizedBox(height: screenHeightMultiply(0.04, context)),
                    const SignForm(),
                    SizedBox(height: screenHeightMultiply(0.01, context)),
                    // MainButton(
                    //     text: context.t!.noAccount,
                    //     function: () =>
                    //         Navigator.pushNamed(context, SignUpScreen.routeName),
                    //     btnColor: $secondaryColor,
                    //     fontColor: checkDarkTheme(context.m)  ? $secondaryBtnDarkTextColor : $secondaryBtnTextColor),
                    SizedBox(height: screenHeightMultiply(0.04, context)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
