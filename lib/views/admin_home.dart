// this page for switch to =>Home screen or => admin dashBord

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omar_system/views/admin_page/admin_main.dart';
import '../app_info.dart';
import '../app_layout.dart';
import '../services/databasehelper.dart';
import '../size_config.dart';
import '../widgets/main_button.dart';

class AdminOrHome extends StatefulWidget {
  static String routeName = "/admin-home";
  const AdminOrHome({super.key});

  @override
  State<AdminOrHome> createState() => _AdminOrHomeState();
}

class _AdminOrHomeState extends State<AdminOrHome> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      databaseHelper.adminCallRecordReport(context, isFiltter: false);
      databaseHelper.adminAttendReport(context);
      databaseHelper.adminCommisionReport(context);
      databaseHelper.adminEffortReport(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          toolbarHeight: 70,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Image.asset(
              'assets/logo-w.png',
              fit: BoxFit.cover,
              height: 30.0,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor:
              checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 650),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidthMultiply(0.10, context)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeightMultiply(0.05, context)),
                      Center(
                        child: Image.asset(
                          checkDarkTheme(context.m)
                              ? 'assets/images/logo-w.png'
                              : 'assets/images/logo.png',
                          fit: BoxFit.contain,
                          height: screenHeightMultiply(0.08, context),
                        ),
                      ),
                      SizedBox(height: screenHeightMultiply(0.05, context)),
                      Text(
                        context.t!.welcomeAgain,
                        style: TextStyle(
                          color: checkDarkTheme(context.m)
                              ? $textDarkColor
                              : $textColor,
                          fontSize: screenWidthDivided(15, context),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenHeightMultiply(0.03, context)),
                      Text(
                        context.t!.decAdminOrHome,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 1.8,
                          fontSize: screenWidthDivided(28, context),
                        ),
                      ),
                      SizedBox(height: screenHeightMultiply(0.04, context)),
                      MainButton(
                          text: context.t!.adminDashBord,
                          function: () async {
                            Navigator.pushNamed(
                                context, AdminMainPage.routeName);
                          },
                          btnColor: checkDarkTheme(context.m)
                              ? $mainDarkColor
                              : $mainColor,
                          fontColor: Colors.white),
                      SizedBox(height: screenHeightMultiply(0.01, context)),
                      MainButton(
                          text: context.t!.myWorkSpace,
                          function: () async {
                            Navigator.pushNamed(context, Home.routeName);
                          },
                          btnColor: checkDarkTheme(context.m)
                              ? $mainDarkColor
                              : $mainColor,
                          fontColor: Colors.white),
                      SizedBox(height: screenHeightMultiply(0.04, context)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
