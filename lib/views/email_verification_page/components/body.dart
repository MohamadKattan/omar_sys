import 'dart:async';
import 'package:flutter/material.dart';
import 'package:omar_system/app_info.dart';
import '../../../services/api_links.dart';
import '../../../services/databasehelper.dart';
import '../../../size_config.dart';
import '../../../widgets/alert_dialog.dart';
import 'email_verification_form.dart';

class Body extends StatefulWidget {



final String email;

  const Body({Key ? key,required this.email}) : super(key: key);

  @override
   BodyState createState() => BodyState();
}

class  BodyState extends State<Body> {
  late  bool _loading2 = false;

  int time = 60;

  late Timer countdownTimer;
  Duration myDuration = const Duration(minutes: 2);

  /// Timer related methods ///
  // Step 3
  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 4
  void stopTimer() {
    setState(() => countdownTimer.cancel());
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = const Duration(minutes: 2));
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  bool canSend = false;
  // Step 6
  void setCountDown() {
    const reduceSecondsBy = 1;
    if (mounted) {
      setState(() {
        final seconds = myDuration.inSeconds - reduceSecondsBy;
        if (seconds < 0) {
          countdownTimer.cancel();
          canSend = true;
        } else {
          myDuration = Duration(seconds: seconds);
        }
      });
    }

  }
  @override
  void initState() {
    super.initState();
    startTimer();
  }
  // @override
  // void dispose(){
  //   super.dispose();
  //   stopTimer();
  //
  // }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        title:  Text(context.t!.areYouSure),
        content:  Text(context.t!.doYouWantToOutOfPage),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child:  Text(context.t!.no),
          ),
          TextButton(
            onPressed: () {
              stopTimer();

              Navigator.of(context).pop(true);
              },
            child:  Text(context.t!.yes),
          ),
        ],
      ),
    )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    return WillPopScope(
      onWillPop: _onWillPop,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: screenWidthDivided(30, context)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeightMultiply(0.25, context)),
                Text(
                  context.t!.confirmEmail,
                  style: TextStyle(
                    fontSize: screenWidthDivided(20, context)
                  ),
                ),
                SizedBox(height: screenHeightMultiply(0.03, context)),
                 Text(context.t!.confirmEmailDes),
                SizedBox(height: screenHeightMultiply(0.02, context)),
                Text(widget.email),
                EmailVerificationForm(stopTimer: stopTimer,),
                SizedBox(height: screenHeightMultiply(0.05, context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(context.t!.youCanRequestAgainIn),
                    Text(
                      ' $minutes:$seconds',
                      style:  TextStyle(color:  checkDarkTheme(context.m)  ? $mainDarkColor : $mainColor),
                    ),
                  ],
                ),
                SizedBox(height: screenHeightMultiply(0.01, context)),
                GestureDetector(
                  onTap: () async {

                    if (canSend) {
                      setState(() {
                        _loading2 = true;
                      });


                      final apiResponse = await databaseHelper
                          .postData(sendCodeEmailURL, {});
                      if (await apiResponse.data["errNum"] == "200") {
                            resetTimer();

                            setState(() {
                            _loading2 = false;
                            canSend = false;
                            });
                      } else if (await apiResponse.data["errNum"] != "200") {
                        if (!mounted) return;

                        showAlertDialogWithIcon(
                            context,
                            context.t!.restPasswordEmailDidntSent,
                            Icons.block,
                            Colors.red);
                        resetTimer();

                        setState(() {
                          _loading2 = false;
                          canSend = false;
                        });
                      }


                    }
                  },
                  child: Text(
                      context.t!.sendCodeAgain,
                      style:  TextStyle(decoration: TextDecoration.underline,
                        color: canSend ? Colors.black : Colors.grey),
                  ),
                ),
                SizedBox(height:screenHeightMultiply(0.2, context)),
                if (_loading2) const CircularProgressIndicator(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
