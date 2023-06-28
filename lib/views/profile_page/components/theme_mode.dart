import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:omar_system/app_info.dart';
import '../../../size_config.dart';
import '../../../widgets/select_theme_mode.dart';

class ChangeAppThemeMode extends StatefulWidget {
  const ChangeAppThemeMode({Key? key}) : super(key: key);

  @override
  State<ChangeAppThemeMode> createState() => _ChangeAppThemeModeState();
}

class _ChangeAppThemeModeState extends State<ChangeAppThemeMode> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: screenWidthMultiply(0.06, context),
          right: screenWidthMultiply(0.06, context)),
      child: GestureDetector(
        onTap: () {
          selectThemeMode(context);
        },
        child: Column(
          children: [
            SizedBox(
              height: screenHeightMultiply(0.03, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    checkDarkTheme(context.m)
                        ? const Icon(
                            Iconsax.moon,
                          )
                        : const Icon(
                            Icons.wb_sunny_outlined,
                          ),
                    SizedBox(
                      width: screenWidthMultiply(0.06, context),
                    ),
                    checkDarkTheme(context.m)
                        ? Text(
                            context.t!.darkMode,
                          )
                        : Text(
                            context.t!.lightMode,
                          )
                  ],
                ),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
            SizedBox(
              height: screenHeightMultiply(0.01, context),
            ),
          ],
        ),
      ),
    );
  }
}
