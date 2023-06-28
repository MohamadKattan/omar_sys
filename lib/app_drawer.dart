import 'package:flutter/material.dart';
import 'package:omar_system/services/databasehelper.dart';
import 'package:omar_system/services/functions.dart';
import 'package:omar_system/services/provider.dart';
import 'package:omar_system/widgets/main_button.dart';
import 'app_info.dart';
import 'app_layout.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool logOut = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                  height: 250.0,
                )),
          ),
          !logOut ?  MainButton(
              text: "تسجيل الخروج",
              function: () {
                setState(() {
                  logOut = true;
                });
                databaseHelper.logOut().then((v) {
                  if (v == false) {
                    functions.tokenState().then((value) => setState(() {
                      riverpod.read(tokenState.notifier).state = value;
                    }));
                    Navigator.pushReplacement<void, void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const AppLayout(),
                      ),
                    );
                  } else {
                    setState(() {
                      logOut = false;
                    });
                    final snackBar = SnackBar(
                      content:
                      const Text("حدث خطأ ما يرجى المحاولة مرة اخرى  .. "),
                      action: SnackBarAction(
                        label: '',
                        onPressed: () {},
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              },
              btnColor: checkDarkTheme(context.m)  ? $mainDarkColor : $mainColor,
              fontColor: Colors.white): const Center(child:  CircularProgressIndicator()),
        ],
      ),
    );
  }
}
