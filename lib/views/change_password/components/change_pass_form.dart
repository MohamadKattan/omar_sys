import 'package:flutter/material.dart';
import 'package:omar_system/app_info.dart';
import '../../../services/api_links.dart';
import '../../../services/databasehelper.dart';
import '../../../size_config.dart';
import '../../../widgets/alert_dialog.dart';
import '../../../widgets/form_error.dart';
import '../../../widgets/main_button.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({Key? key}) : super(key: key);

  @override
  ChangePasswordFormState createState() => ChangePasswordFormState();
}

class ChangePasswordFormState extends State<ChangePasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  late String name;
  late String email;
  late String oldPassword;
  late String password;
  // ignore: non_constant_identifier_names
  late String conform_password;
  // String phone;
  bool remember = false;
  final List<String> errors = [];
  bool _loading = false;

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
          SizedBox(height: screenHeightDivided(30, context)),
          buildOldPasswordFormField(),
          SizedBox(height: screenHeightDivided(30, context)),
           Divider(
            thickness: 1,
            color: Colors.black.withOpacity(0.2),
          ),
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
                      color: obscureText ? Colors.black54 : Colors.blueAccent,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: screenHeightDivided(40, context)),
          FormError(errors: errors),
          SizedBox(height: screenHeightDivided(30, context)),
          !_loading
              ? MainButton(
                  text: context.t!.changePassword,
                  function: () async {
                    setState(() => _loading = true);

                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();

                      try {
                        final apiResponse =
                            await databaseHelper.postData(changePasswordURL, {
                          "old_password": oldPassword,
                          "new_password": password,
                          "confirm_password": conform_password,
                        });

                        if (await apiResponse.data["status"] == true) {
                          if (!mounted) return;
                          showAlertDialogWithIcon(
                          context, context.t!.passwordChangedSuccessfully,
                          Icons.check_circle_outline,
                          Colors.green);
                          setState(() => _loading = false);
                        } else if (await apiResponse.data["status"] == false) {

                          if (!mounted) return;
                          showAlertDialogWithIcon(
                          context,
                          '${apiResponse.data["msg"]}',
                          Icons.block,
                          Colors.red);
                          setState(() => _loading = false);

                        } else if (await apiResponse != 200 &&
                            apiResponse != 401) {
                          if (!mounted) return;

                          showAlertDialog(
                              context, context.t!.somethingsWrongTryAgain);
                          setState(() => _loading = false);
                        }
                      } catch (e) {
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

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: obscureText,
      onSaved: (newValue) => conform_password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: context.t!.pleaseConfirmNewPass);
        } else if (value.isNotEmpty && password == conform_password) {
          removeError(error: context.t!.passwordUnMatch);
        }
        conform_password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: context.t!.pleaseConfirmNewPass);
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
        labelText: context.t!.confirmNewPassword,
        hintText: context.t!.enterNewPassAgain,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
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

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: obscureText,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: context.t!.pleaseEnterNewPassAgain);
        } else if (value.length >= 8) {
          removeError(error: context.t!.passMustContainEight);
        }
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: context.t!.pleaseEnterNewPassAgain);
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
        labelText: context.t!.newPass,
        hintText: context.t!.enterNewPass,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
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

  TextFormField buildOldPasswordFormField() {
    return TextFormField(
      obscureText: obscureText,
      onSaved: (newValue) => oldPassword = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: context.t!.pleaseEnterOldPass);
        } else if (value.length >= 6) {
          removeError(error: context.t!.passMustContainEight);
        }
        oldPassword = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: context.t!.pleaseEnterOldPass);
          return "";
        } else if (value.length < 6) {
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
        labelText: context.t!.oldPassword,
        hintText: context.t!.enterYourOldPassword,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
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
}
