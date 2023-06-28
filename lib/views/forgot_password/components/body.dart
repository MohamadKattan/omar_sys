import 'package:omar_system/app_info.dart';
import 'package:omar_system/size_config.dart';
import 'package:flutter/material.dart';
import 'package:omar_system/widgets/main_button.dart';
import '../../../constants.dart';
import '../../../services/api_links.dart';
import '../../../services/databasehelper.dart';
import '../../../widgets/form_error.dart';
import '../../sign_up/sign_up_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 650),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidthDivided(20, context)),
              child: Column(
                children: [
                  SizedBox(height: screenHeightMultiply(0.19, context)),
                  Text(
                    context.t!.forgetYourPassword,
                    style: TextStyle(
                      fontSize: screenWidthDivided(20, context),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    context.t!.forgetYourPasswordDes,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeightMultiply(0.1, context)),
                  const ForgotPassForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key}) : super(key: key);

  @override
  ForgotPassFormState createState() => ForgotPassFormState();
}

class ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

  List<String> errors = [];
  late String email;


  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue!,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: context.t!.pleaseEnterEmail);
              } else if (emailValidatorRegExp.hasMatch(value)) {
                removeError(error: context.t!.pleaseEnterValidEmail);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: context.t!.pleaseEnterEmail);
                return "";
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                addError(error: context.t!.pleaseEnterValidEmail);
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular($borderRadius.toDouble())),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular($borderRadius.toDouble())),
              ),
              border: OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular($borderRadius.toDouble())),
              ),
              labelText: context.t!.email,
              hintText: context.t!.enterYourEmail,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: const Icon(Icons.email),
            ),
          ),
          SizedBox(height: screenHeightDivided(30, context)),
          FormError(errors: errors),
          SizedBox(height: screenHeightMultiply(0.1, context)),
          !_loading
              ? MainButton(
                  text: context.t!.continues,
                  function: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      setState(() => _loading = true);

                      final apiResponse = await databaseHelper
                          .postData(forgotPasswordURL, {"email": email});
                      if (await apiResponse.data["errNum"] == "200") {
                        if (!mounted) return;

                        showAlertDialog(
                            context,
                            context.t!.restPasswordEmailSent,
                            Icons.check_circle_outline,
                            Colors.green);
                        setState(() => _loading = false);
                      } else if (await apiResponse.data["errNum"] != "200") {
                        if (!mounted) return;

                        showAlertDialog(
                            context,
                            context.t!.restPasswordEmailDidntSent,
                            Icons.block,
                            Colors.red);
                        setState(() => _loading = false);
                      }
                    }
                  },
                  btnColor: checkDarkTheme(context.m)  ? $mainDarkColor : $mainColor,
                  fontColor: Colors.white)
              : const CircularProgressIndicator(),
          SizedBox(height: screenHeightMultiply(0.1, context)),
          // const NoAccountText(),
        ],
      ),
    );
  }
}


class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.t!.noAccount,
          style: TextStyle(fontSize: screenWidthDivided(25, context)),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
          child: Text(
            context.t!.makeNewAccount,
            style: TextStyle(
                fontSize: screenWidthDivided(25, context), color: checkDarkTheme(context.m)  ? $mainDarkColor : $mainColor),
          ),
        ),
      ],
    );
  }
}

showAlertDialog(
    BuildContext context, String error, IconData icon, Color color) {
  // set up the button
  // Widget okButton = FlatButton(
  //   child: Text("OK"),
  //   onPressed: () { },
  // );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    // title: Text("My title"),
    content:
        // Text("$error",textAlign: TextAlign.center,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            Icon(
              icon,
              size: 50,
              color: color,
            ),
            const SizedBox(width: 5),
            SizedBox(
              width: 200,
              child: Text(
                error, textAlign: TextAlign.center,
                // maxLines: 2,
                // overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  height: 1.4,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
        ],
      ),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))),
    // actions: [
    //   // okButton,
    // ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
