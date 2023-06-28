import 'package:flutter/material.dart';
import 'package:omar_system/app_info.dart';
import 'package:omar_system/size_config.dart';
import 'package:omar_system/views/sign_in/sign_in_screen.dart';
import '../widgets/main_button.dart';

class NewAccount extends StatefulWidget {
  static String routeName = "/new-account";

  const NewAccount({Key? key}) : super(key: key);

  @override
  State<NewAccount> createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {
  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: const Color(0xff2e2e2e),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeightMultiply(0.04, context)),
                SizedBox(
                  height: screenHeightMultiply(0.40, context),
                  child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Image.asset(
                        'assets/images/omar-1.png',
                      )),
                ),
                SizedBox(height: screenHeightMultiply(0.03, context)),
                Text(context.t!.newAccountTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: screenWidthDivided(19, context),
                        height: 1.8,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
                SizedBox(height: screenHeightMultiply(0.02, context)),
                Text(context.t!.newAccountDes,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.8,
                      color: Colors.white,
                      fontSize: screenWidthDivided(30, context),
                    )),
                SizedBox(height: screenHeightMultiply(0.04, context)),
                // MainButton(
                //   text: context.t!.createAccount.toUpperCase(),
                //   function: () => Navigator.pushNamed(context, SignUpScreen.routeName),
                //   fontColor: Colors.white,
                //   btnColor: checkDarkTheme(context.m)  ? $mainDarkColor : $mainColor,
                // ),
                SizedBox(height: screenHeightMultiply(0.01, context)),
                MainButton(
                  text: context.t!.signIn.toUpperCase(),
                  function: () =>
                      Navigator.pushNamed(context, SignInScreen.routeName),
                  fontColor: checkDarkTheme(context.m)
                      ? $secondaryBtnTextColor
                      : $secondaryBtnDarkTextColor,
                  btnColor:
                      checkDarkTheme(context.m) ? $mainLightColor : $mainColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
