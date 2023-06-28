import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../../app_info.dart';
import '../../size_config.dart';
import 'components/body.dart';

class EditProfileScreen extends StatefulWidget {
  static String routeName = "/edit_profile";
  final VoidCallback? refresh;

  const EditProfileScreen({Key? key, this.refresh}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            title: Text(context.t!.areYouSure),
            content: Text(context.t!.doYouWantToOutOfPage),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(context.t!.no),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(context.t!.yes),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: KeyboardDismisser(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              context.t!.editProfile,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidthDivided(25, context)),
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
            refresh: widget.refresh,
          ),
        ),
      ),
    );
  }
}
