import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:omar_system/app_info.dart';
import 'package:omar_system/size_config.dart';
import 'package:omar_system/widgets/main_button.dart';
import '../../../app_layout.dart';
import '../../../constants.dart';
import '../../../services/databasehelper.dart';
import '../../../services/functions.dart';
import '../../../services/provider.dart';
import '../../../widgets/alert_dialog.dart';
import '../../../widgets/form_error.dart';
import '../../forgot_password/forgot_password_screen.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  SignFormState createState() => SignFormState();
}

class SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  bool remember = false;
  final List<String> errors = [];
  bool _loading = false;
  late String fcmToken;
  bool obscureText = true;

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
          buildEmailFormField(),
          SizedBox(height: screenHeightDivided(30, context)),
          buildPasswordFormField(),
          SizedBox(height: screenHeightDivided(30, context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (obscureText == true) {
                      obscureText = false;
                    } else {
                      obscureText = true;
                    }
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      context.t!.showPassword,
                      style: TextStyle(
                          fontSize: 13,
                          color: obscureText
                              ? checkDarkTheme(context.m)
                                  ? $textDarkColor
                                  : $textColor
                              : Colors.orange),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Icon(
                      Icons.remove_red_eye_outlined,
                      size: 17,
                      color: obscureText
                          ? checkDarkTheme(context.m)
                              ? $textDarkColor
                              : $textColor
                          : Colors.orange,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: screenHeightDivided(30, context)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor:
                    checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
                onChanged: (value) {
                  setState(() {
                    remember = value!;
                  });
                },
              ),
              Text(context.t!.rememberMe),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  context.t!.forgetYourPassword,
                  style: const TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          SizedBox(height: screenHeightDivided(35, context)),
          FormError(
            errors: errors,
          ),
          !_loading
              ? MainButton(
                  text: context.t!.signIn,
                  function: () async {
                    setState(() => _loading = true);

                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();

                      try {
                        String deviceName = await functions.getDeviceInfo();
                        bool apiResponse = await databaseHelper.loginData(
                            email, password, deviceName);

                        if (apiResponse) {
                          if (!mounted) return;
                          functions.tokenState().then((value) => setState(() {
                                riverpod.read(tokenState.notifier).state =
                                    value;
                              }));
                          Navigator.pushReplacement<void, void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const AppLayout(),
                            ),
                          );
                          setState(() => _loading = false);
                        } else if (!apiResponse) {
                          if (!mounted) return;
                          showAlertDialog(
                              context, context.t!.makeSurePassANdEmail);
                          setState(() => _loading = false);
                        }
                      } catch (e) {
                        if (kDebugMode) {
                          print(e);
                        }
                        showAlertDialog(context, context.t!.weHaveProblem);
                        setState(() => _loading = false);
                      }
                    } else {
                      setState(() => _loading = false);
                    }
                  },
                  btnColor:
                      checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
                  fontColor: Colors.white)
              : const CircularProgressIndicator(),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: obscureText,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: context.t!.pleaseEnterPass);
        } else if (value.length >= 6) {
          removeError(error: context.t!.passMustContainEight);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: context.t!.pleaseEnterPass);
          return "";
        } else if (value.length < 6) {
          addError(error: context.t!.passMustContainEight);
          return "";
        }
        return null;
      },

      // textDirection: TextDirection.ltr,
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
        labelText: context.t!.passWord,
        hintText: context.t!.enterYourPass,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                if (obscureText == true) {
                  obscureText = false;
                } else {
                  obscureText = true;
                }
              });
            },
            child: const Icon(Icons.password)),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
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
    );
  }
}
