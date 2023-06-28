import 'dart:async';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:omar_system/app_info.dart';
import 'package:omar_system/services/local_database.dart';
import 'package:omar_system/services/provider.dart';
import 'package:omar_system/size_config.dart';
import 'package:omar_system/views/admin_home.dart';
import 'package:omar_system/views/admin_page/admin_main.dart';
import 'package:omar_system/views/attendance_page/attendance_page.dart';
import 'package:omar_system/views/billing_page/billing_page.dart';
import 'package:omar_system/views/home_page/home.dart';
import 'package:omar_system/views/new_account.dart';
import 'package:omar_system/views/profile_page/profile.dart';
import 'package:omar_system/views/sections_page/sections_page.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);
  static String routeName = "/";

  @override
  State<AppLayout> createState() => _State();
}

class _State extends State<AppLayout> {
  late bool hasToken = riverpod.read(tokenState);

  late StreamSubscription<DataConnectionStatus> listener;

  var internetStatus = "Unknown";
  bool _isInForeground = true;
  bool _newStart = true;

  checkInternet() async {
    DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          internetStatus = context.t!.connectedToTheInternet;
          if (!_newStart) {
            final snackBar = SnackBar(
              content: Text(internetStatus),
              action: SnackBarAction(
                label: '',
                onPressed: () {},
              ),
            );
            if (_isInForeground) {
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          }
          _newStart = false;

          break;
        case DataConnectionStatus.disconnected:
          internetStatus = context.t!.noInternetConnection;
          final snackBar = SnackBar(
            content: Text(internetStatus),
            action: SnackBarAction(
              label: '',
              onPressed: () {},
            ),
          );
          if (_isInForeground) {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          break;
      }
    });
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    _isInForeground = state == AppLifecycleState.resumed;
  }

  refresh() {
    setState(() {});
    if (kDebugMode) {
      print('Home Refresh');
    }
  }

  @override
  void initState() {
    super.initState();
    // checkInternet();
  }

  @override
  Widget build(BuildContext context) {
    return hasToken
        ? dataBase.getAdminName == 'admin'
            ? const AdminOrHome()
            : Home(
                function: refresh,
              )
        : const NewAccount();
  }
}

class Home extends StatefulWidget {
  static String routeName = "/home";
  final VoidCallback? function;

  const Home({Key? key, this.function}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  late bool hasToken = riverpod.read(tokenState);

  // int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[];

  Future<bool> _onWillPop() async {
    if (riverpod.read(selectedIndex) == 4) {
      setState(() {
        riverpod.read(selectedIndex.notifier).state = 3;
      });
      return false;
    } else if (riverpod.read(selectedIndex) == 3) {
      setState(() {
        riverpod.read(selectedIndex.notifier).state = 2;
      });
      return false;
    } else if (riverpod.read(selectedIndex) == 2) {
      setState(() {
        riverpod.read(selectedIndex.notifier).state = 1;
      });
      return false;
    } else if (riverpod.read(selectedIndex) == 1) {
      setState(() {
        riverpod.read(selectedIndex.notifier).state = 0;
      });
      return false;
    } else if (riverpod.read(selectedIndex) == 0) {
      return true;
    }
    return true;
  }

  changePage(number) {
    setState(() {
      riverpod.read(selectedIndex.notifier).state = number;
    });
  }

  @override
  void initState() {
    setState(() {});
    super.initState();
    _widgetOptions = <Widget>[
      HomeWidget(
        function: widget.function,
        cahngePage: changePage,
      ),
      SectionsPage(
        function: widget.function,
      ),
      AttendancePage(
        function: widget.function,
      ),
      BillingPage(
        function: widget.function,
      ),
      ProfilePage(
        function: widget.function,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        // backgroundColor: Colors.white,
        // drawer: const AppDrawer(),
        appBar: AppBar(
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
          actions: <Widget>[
            SizedBox(
              width: screenWidthMultiply(0.03, context),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  riverpod.read(selectedIndex.notifier).state = 4;
                });
              },
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    color: checkDarkTheme(context.m)
                        ? $homeDarkSearchInput
                        : $homeSearchInput,
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Icon(Iconsax.user,
                        color: checkDarkTheme(context.m)
                            ? $homeCartDarkIconColor
                            : $homeCartIconColor),
                  ),
                ),
                // riverpod.read(inCartNumber) != 0
                //     ? Positioned(
                //         top: 3.0,
                //         right: 3.0,
                //         child: Container(
                //           width: 16,
                //           height: 16,
                //           decoration: const BoxDecoration(
                //             color: Colors.red,
                //             borderRadius: BorderRadius.all(Radius.circular(50)),
                //           ),
                //           child: Center(
                //             child: Text(
                //               riverpod.read(inCartNumber).toString(),
                //               style: const TextStyle(
                //                   color: Colors.white,
                //                   fontSize: 12.0,
                //                   fontWeight: FontWeight.w600),
                //             ),
                //           ),
                //         ))
                //     : const SizedBox(),
              ]),
            ),
            SizedBox(
              width: screenWidthMultiply(0.02, context),
            ),
            dataBase.getAdminName == "admin"
                ? TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AdminMainPage.routeName);
                    },
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: checkDarkTheme(context.m)
                                ? $homeDarkSearchInput
                                : $homeSearchInput,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Icon(Iconsax.gameboy,
                                color: checkDarkTheme(context.m)
                                    ? $homeCartDarkIconColor
                                    : $homeCartIconColor),
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
          ],
        ),
        body: Center(
          child: _widgetOptions.elementAt(riverpod.read(selectedIndex)),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: checkDarkTheme(context.m)
                ? $homeNavBarDarkColor
                : $homeNavBarColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                // backgroundColor : checkDarkTheme(context.m)  ? $homeNavBarDarkColor : $homeNavBarColor,
                mainAxisAlignment: isMobile(context)
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                rippleColor:
                    checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
                hoverColor:
                    checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
                gap: screenWidthDivided(45, context),
                activeColor: Colors.white,
                iconSize: screenWidthDivided(18, context),
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidthDivided(25, context), vertical: 8),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor:
                    checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
                color: checkDarkTheme(context.m)
                    ? $homeNavBarTextDarkColor
                    : $homeNavBarTextColor,
                // textSize: screenWidthDivided(25 , context),
                tabBorderRadius: $borderRadius.toDouble(),
                textStyle: TextStyle(
                    fontSize: screenWidthDivided(25, context),
                    color: Colors.white),

                tabs: [
                  GButton(
                    icon: Iconsax.home,
                    text: context.t!.home,
                  ),
                  const GButton(
                    icon: Icons.library_books_sharp,
                    text: 'Sections',
                  ),
                  const GButton(
                    icon: Iconsax.profile_2user,
                    text: 'Attendance',
                  ),
                  const GButton(
                    icon: Icons.attach_money,
                    text: 'Billing',
                  ),
                  // const GButton(
                  //   icon: Icons.stacked_bar_chart_sharp ,
                  //   text: 'Report',
                  // ),
                  GButton(
                    icon: Iconsax.profile_circle,
                    text: context.t!.account,
                  ),
                ],
                selectedIndex: riverpod.read(selectedIndex),
                onTabChange: (index) {
                  setState(() {
                    riverpod.read(selectedIndex.notifier).state = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
