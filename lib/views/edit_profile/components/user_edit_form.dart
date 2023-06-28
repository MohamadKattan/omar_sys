import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:omar_system/app_info.dart';
import 'package:omar_system/controllers/user_controller.dart';
import 'package:omar_system/size_config.dart';
import 'package:omar_system/widgets/main_button.dart';
import '../../../constants.dart';
import '../../../services/api_links.dart';
import '../../../services/databasehelper.dart';
import '../../../services/provider.dart';
import '../../../widgets/alert_dialog.dart';
import '../../../widgets/form_error.dart';

class EditProfileForm extends StatefulWidget {
  final VoidCallback? refresh;

  const EditProfileForm({Key? key,required this.refresh}) : super(key: key);

  @override
  EditProfileFormState createState() => EditProfileFormState();
}

class EditProfileFormState extends State<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  late String name;
  late String email;
  final List<String> errors = [];
  bool _loading = false;
  String initialCountry = 'TR';
  PhoneNumber phone = PhoneNumber(
    isoCode: 'TR',
  );



  late String image;
  late String imageFile;

   Future<File>? avatarFile;
   File? avatarFile2;
   File? avatarTmpFile;
  bool hasImage = false;


  // double _progressStatePost = 0;
  String progressTextPost = "جاري تعديل الملف الشخصي  ..";


  showImage() {
    return FutureBuilder<File>(
      future: avatarFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          avatarTmpFile = snapshot.data!;
          imageFile = base64Encode(snapshot.data!.readAsBytesSync());
          return CircleAvatar(
            radius: 70,
            backgroundImage: FileImage(snapshot.data!),
          );
        }
        return const CircleAvatar(
          radius: 70,
          child: CircularProgressIndicator(),
        );
      },
    );
  }

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

    setState(() {

    name = userController.user.name;
    email = userController.user.email;
    phone = PhoneNumber(
        isoCode: 'TR', phoneNumber: '${userController.user.phone}');
    image = userController.user.avatarUrl!;
    });
    showImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildImageFormField(),
          SizedBox(height: screenHeightDivided(20, context)),
          buildNameFormField(),
          SizedBox(height: screenHeightDivided(30, context)),
          buildEmailFormField(),
          SizedBox(height: screenHeightDivided(30, context)),
          buildPhoneFormField(),
          SizedBox(height: screenHeightDivided(30, context)),
          FormError(errors: errors),
          SizedBox(height: screenHeightDivided(30, context)),
          !_loading
              ? MainButton(
              text: context.t!.editProfile,
              function: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  setState(() => _loading = true);

                  try {
                    var formData = FormData.fromMap({
                      'name': name,
                      'phone': "$phone",
                      'email': email,
                      if (avatarFile2 != null)
                        "avatar": await MultipartFile.fromFile(avatarFile2!.path,
                            filename: avatarFile2!.path )
                    });

                    final apiResponse = await databaseHelper.postData(updateProfileURL,
                        formData
                    );
                    if (kDebugMode) {
                      print(apiResponse.data);
                    }
                    if (await apiResponse.data["errNum"] ==
                        "200") {
                      if (!mounted) return;

                      // showAlertDialogWithIcon(
                      //     context, context.t!.profileUpdateSuccessfully,
                      //     Icons.check_circle_outline,
                      //     Colors.green);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(context.t!.profileUpdateSuccessfully)));

                      setState(() => _loading = false);
                      userController.getUserData().then((v) {
                        if (userController.profileHasErr) {
                         widget.refresh!();
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(context.t!.weHaveProblem)));
                        } else {
                          Navigator.pop(context);
                          widget.refresh!();
                          setState(() {
                            riverpod.read(profileFirstOpen.notifier).state = false;
                          });
                        }
                      });

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
                    if (kDebugMode) {
                      print(e);
                    }
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

  buildImageFormField() {
    return Row(
      // padding: EdgeInsets.all(15),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() async {
              final ImagePicker picker = ImagePicker();

              final pickedFile = await picker.pickImage(
                source: ImageSource.gallery,
                imageQuality: 25,
              );
              avatarFile2 = File(pickedFile!.path);

              if (avatarFile2 != null) {
                setState(() {
                  hasImage = true;
                });
              } else {
                hasImage = false;
              }
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(
              left: 12,
            ),
            child: avatarFile2 == null
                ? CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(image),
            )
                : CircleAvatar(
              radius: 70,
              backgroundImage: FileImage(avatarFile2!),
            ),
          ),
        ),
      ],
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      initialValue: name,
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


  TextFormField buildEmailFormField() {
    return TextFormField(
      initialValue: email,
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
