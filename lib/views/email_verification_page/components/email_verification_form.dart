// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omar_system/app_info.dart';
import '../../../app_layout.dart';
import '../../../controllers/user_controller.dart';
import '../../../services/api_links.dart';
import '../../../services/databasehelper.dart';
import '../../../services/provider.dart';
import '../../../size_config.dart';
import '../../../widgets/alert_dialog.dart';
import '../../../widgets/form_error.dart';
import '../../../widgets/main_button.dart';

class EmailVerificationForm extends StatefulWidget {
  final VoidCallback? stopTimer;
  const EmailVerificationForm({Key? key, required this.stopTimer})
      : super(key: key);

  @override
  SignUpFormState createState() => SignUpFormState();
}

class SignUpFormState extends State<EmailVerificationForm> {
  final _formKey = GlobalKey<FormState>();

  late String code;

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
          SizedBox(height: screenHeightMultiply(0.02, context)),
          buildPasswordFormField(),
          FormError(errors: errors),
          SizedBox(height: screenHeightMultiply(0.02, context)),
          !_loading
              ? MainButton(
                  text: context.t!.confirmAccount,
                  function: () async {
                    setState(() => _loading = true);
                    widget.stopTimer!();

                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      final apiResponse =
                          await databaseHelper.postData(validateEmailURL, {
                        "code": code,
                      });

                      if (await apiResponse.data["status"] == true) {
                        if (!mounted) return;

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(context.t!.emailConfirmDone)));
                        setState(() => _loading = false);

                        userController.getUserData().then((v) {
                          if (userController.profileHasErr) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(context.t!.weHaveProblem)));
                          } else {
                            Navigator.pushReplacement<void, void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const AppLayout(),
                              ),
                            );
                            setState(() {
                              riverpod.read(profileFirstOpen.notifier).state =
                                  false;
                            });
                          }
                        });
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
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      onSaved: (newValue) => code = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: context.t!.enterOpt);
        } else if (value.length >= 6) {
          removeError(error: context.t!.shortOpt);
        }
        code = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: context.t!.enterOpt);
          return "";
        } else if (value.length < 6) {
          addError(error: context.t!.shortOpt);
          return "";
        }
        return null;
      },
      textDirection: TextDirection.ltr,
      toolbarOptions: const ToolbarOptions(
        paste: true,
        cut: true,
        copy: true,
        selectAll: true,
      ),
      decoration: InputDecoration(
        labelText: context.t!.opt,
        hintText: context.t!.opt,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const Icon(Icons.numbers),
      ),
    );
  }
}
