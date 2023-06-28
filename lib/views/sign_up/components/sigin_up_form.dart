


// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
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

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  SignUpFormState createState() => SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  late String name;
  late String email;
  late String password;
  late String conformPassword;
  bool remember = false;
  final List<String> errors = [];
  bool _loading = false;
  late String fcmToken;
  String initialCountry = 'TR';
  PhoneNumber phone = PhoneNumber(
    isoCode: 'TR',
  );

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

  bool obscureText = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNameFormField(),
          SizedBox(height: screenHeightDivided(30, context)),
          buildEmailFormField(),
          SizedBox(height: screenHeightDivided(30, context)),
          buildPasswordFormField(),
          SizedBox(height: screenHeightDivided(30, context)),
          buildConformPassFormField(),
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
                          color: obscureText ? checkDarkTheme(context.m)  ? $textDarkColor : $textColor : Colors.orange),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Icon(
                      Icons.remove_red_eye_outlined,
                      size: 17,
                      color: obscureText ? checkDarkTheme(context.m)  ? $textDarkColor : $textColor : Colors.orange,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: screenHeightDivided(30, context)),
          buildPhoneFormField(),
          SizedBox(height: screenHeightDivided(30, context)),
          FormError(errors: errors),
          SizedBox(height: screenHeightDivided(30, context)),
          !_loading
              ? MainButton(
              text: context.t!.createAccount,
              function: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  setState(() => _loading = true);

                  try {

                    String deviceName = await functions.getDeviceInfo();


                    final apiResponse = await databaseHelper.registerData(
                        name,
                        email,
                        password,
                        conformPassword,
                        "$phone",
                        'fcmToken',
                        'ar'
                    );
                    if (kDebugMode) {
                      print(apiResponse.data);
                    }
                    if (await apiResponse.data["errNum"] ==
                        "200") {

                      final apiResponse2 = await databaseHelper.loginData(
                          email, password, deviceName);
                      if (await apiResponse2.data["errNum"] == "200") {
                        if (!mounted) return;
                        functions.tokenState().then((value) => setState(() {
                          riverpod.read(tokenState.notifier).state = value;
                        }));
                        Navigator.pushReplacement<void, void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                            const AppLayout(),
                          ),
                        );
                      } else if (await apiResponse2.data["errNum"] != "200") {
                        // print("ok 4");
                        if (!mounted) return;

                        showAlertDialog(
                            context, context.t!.somethingsWrongTryAgain);
                        setState(() => _loading = false);
                      }
                    } else if (await apiResponse.data["errNum"] !=
                        "200") {
                      // print("ok 5");
                      if (!mounted) return;

                      showAlertDialog(
                          context, '${apiResponse.data["msg"]}');
                      setState(() => _loading = false);
                    }
                  } catch (e){
                    showAlertDialog(
                        context, context.t!.weHaveProblem);
                    setState(() => _loading = false);
                  }

                }
              },
              btnColor: checkDarkTheme(context.m)  ? $mainDarkColor : $mainColor,
              fontColor: Colors.white)
              : const CircularProgressIndicator.adaptive(),
        ],
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      toolbarOptions: const ToolbarOptions(
        paste: true,
        cut: true,
        copy: true,
        selectAll: true,
      ),
      // obscureText: true,
      onSaved: (newValue) => name = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: context.t!.pleaseEnterUserName);
        }
        // else if (nameValidatorRegExp.hasMatch(value)) {
        //   removeError(error: "يرجى ادخال اسم مستخدم صالح");
        // }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: context.t!.pleaseEnterUserName);
          return "";
        }
        // else if (!nameValidatorRegExp.hasMatch(value)) {
        //   addError(error: "يرجى ادخال اسم مستخدم صالح");
        //   return "";
        // }
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

        labelText: context.t!.userName,
        hintText: context.t!.enterUserName,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const Icon(Icons.supervised_user_circle_outlined),
      ),
    );
  }

  buildPhoneFormField() {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {
        // print(number.phoneNumber);
        phone = number;
      },
      onInputValidated: (bool value) {
        // print(value);
      },
      errorMessage: context.t!.pleasePhoneNumber,
      textAlign: TextAlign.start,
      selectorConfig: const SelectorConfig(
        useEmoji: true,
        selectorType: PhoneInputSelectorType.DIALOG,
      ),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.disabled,
      // selectorTextStyle: const TextStyle(color: Colors.black),
      initialValue: phone,
      textFieldController: controller,
      formatInput: false,
      keyboardType:
      const TextInputType.numberWithOptions(signed: true, decimal: true),
      inputDecoration :InputDecoration(
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
        hintText: context.t!.enterPhoneNumber,

      ),
      inputBorder: OutlineInputBorder(
        borderRadius:
        BorderRadius.all(Radius.circular($borderRadius.toDouble())),
      ),
      onSaved: (PhoneNumber number) => phone = number,
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: obscureText,
      onSaved: (newValue) => conformPassword = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: context.t!.pleaseEnterPass);
        } else if (value.isNotEmpty && password == conformPassword) {
          removeError(error: context.t!.passwordUnMatch);
        }
        conformPassword = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: context.t!.pleaseEnterPass);
          return "";
        } else if ((password != value)) {
          addError(error: context.t!.passwordUnMatch);
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
        labelText: context.t!.confirmYourPassAgain,
        hintText: context.t!.enterYourPassAgain,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const Icon(Icons.password),
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
        } else if (value.length >= 8) {
          removeError(error: context.t!.passMustContainEight);
        }
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: context.t!.pleaseEnterPass);
          return "";
        } else if (value.length < 8) {
          addError(error: context.t!.passMustContainEight);
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
        labelText: context.t!.passWord,
        hintText: context.t!.enterYourPass,

        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const Icon(Icons.password),
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
        suffixIcon: const Icon(Icons.email_outlined),
      ),
    );
  }
}
