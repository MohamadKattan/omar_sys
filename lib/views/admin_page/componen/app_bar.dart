import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

import '../../../app_info.dart';
import '../../../app_layout.dart';
import '../../../size_config.dart';

PreferredSizeWidget adminAppBar(
    {required BuildContext context, required VoidCallback voidCallback}) {
  return AppBar(
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
    backgroundColor: checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    actions: <Widget>[
      TextButton(
        onPressed: () {
          voidCallback();
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: checkDarkTheme(context.m)
                    ? $homeDarkSearchInput
                    : $homeSearchInput,
                borderRadius: const BorderRadius.all(Radius.circular(6)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Icon(Iconsax.filter,
                    color: checkDarkTheme(context.m)
                        ? $homeCartDarkIconColor
                        : $homeCartIconColor),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        width: screenWidthMultiply(0.01, context),
      ),
      TextButton(
        onPressed: () {
          Navigator.pushNamed(context, Home.routeName);
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: checkDarkTheme(context.m)
                    ? $homeDarkSearchInput
                    : $homeSearchInput,
                borderRadius: const BorderRadius.all(Radius.circular(6)),
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
      ),
    ],
  );
}
