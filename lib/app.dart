// ignore_for_file: invalid_use_of_protected_member


import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:omar_system/app_info.dart';
import 'package:omar_system/routes.dart';
import 'package:omar_system/services/local_database.dart';
import 'package:omar_system/theme.dart';
import 'package:omar_system/services/functions.dart';
import 'package:provider/provider.dart';
import 'app_layout.dart';
import 'package:omar_system/services/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  static MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>()!;

// this method for set lan and save in local database
  static void setLocale(BuildContext context, Locale newLocale) async {
    MyAppState? state = context.findAncestorStateOfType<MyAppState>();

    dataBase.saveCountryCode = '';
    dataBase.saveLanguageCode = newLocale.languageCode;

    state?.setState(() {
      // state._locale = newLocale;
    });
  }

  // this method for theme app dark/light and save in local data
  static void changeTheme(BuildContext context, ThemeMode newTheme) async {
    MyAppState? state = context.findAncestorStateOfType<MyAppState>();

    dataBase.saveThemeMood = newTheme.toString();
    functions.isDarkMode(context).then((value) {
      if (value) {
        state?.setState(() {
          riverpod.read(isDarkMode.notifier).state = true;
        });
      } else {
        state?.setState(() {
          riverpod.read(isDarkMode.notifier).state = false;
        });
      }
    });
    state?.setState(() {
      state.themeMode = newTheme;
    });
  }

  @override
  State<MyApp> createState() => MyAppState();
}

final GlobalKey<ScaffoldState> key = GlobalKey();

class MyAppState extends State<MyApp> {
  // late Locale _locale = const Locale('ar', '');
  late bool hasToken = riverpod.read(tokenState);
  late ThemeMode themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    functions.fetchLocale().then((locale) {
      // setState(() {
      //   if (locale != null) {
      //     _locale = locale;
      //     riverpod.read(appLang.notifier).state = locale.languageCode;
      //   }
      // });
    });
    functions.tokenState().then((value) => setState(() {
          riverpod.read(tokenState.notifier).state = value;
          hasToken = value;
        }));
    functions.themeMode().then((value) => setState(() {
          riverpod.read(appThemeMode.notifier).state = value;
          if (riverpod.read(appThemeMode.notifier).state == ThemeMode.dark) {
            setState(() {
              riverpod.read(isDarkMode.notifier).state = true;
            });
          } else {
            setState(() {
              riverpod.read(isDarkMode.notifier).state = false;
            });
          }
          themeMode = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProviderListiner())],
      child: MaterialApp(
        restorationScopeId: 'app',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        // supportedLocales: const [
        //   Locale('en', ''),
        //   Locale('ar', ''),
        // ],
        // locale: _locale,
        onGenerateTitle: (BuildContext context) => context.t!.appTitle,
        theme: theme(context),
        darkTheme: darkTheme(context),
        themeMode: themeMode,
        initialRoute: AppLayout.routeName,
        routes: routes,
      ),
    );
  }
}
