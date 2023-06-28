import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:omar_system/app_info.dart';
import '../app.dart';
import '../size_config.dart';

selectThemeMode(context) {
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) => WillPopScope(
      onWillPop: () => Future.value(true),
      child: AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        title: Center(child: Text(context.t!.choseThemeMode)),
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          width: double.maxFinite,
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: GestureDetector(
                  onTap: () {
                    MyApp.changeTheme(context, ThemeMode.light);

                    Navigator.of(context).pop();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black.withOpacity(0.1)),
                      // color: Colors.grey.shade200,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 12, bottom: 12),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.wb_sunny_outlined,
                          ),
                          SizedBox(
                            width: screenWidthMultiply(0.06, context),
                          ),
                          Text(
                            context.t!.lightMode,
                            style: const TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: GestureDetector(
                  onTap: () {
                    MyApp.changeTheme(context, ThemeMode.dark);

                    Navigator.of(context).pop();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black.withOpacity(0.1)),
                      // color: Colors.grey.shade200,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 12, bottom: 12),
                      child: Row(
                        children: [
                          const Icon(
                            Iconsax.moon,
                          ),
                          SizedBox(
                            width: screenWidthMultiply(0.06, context),
                          ),
                          Text(
                            context.t!.darkMode,
                            style: const TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: GestureDetector(
                  onTap: () {
                    MyApp.changeTheme(context, ThemeMode.system);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black.withOpacity(0.1)),
                      // color: Colors.grey.shade200,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 12, bottom: 12),
                      child: Row(
                        children: [
                          const Icon(
                            Iconsax.setting,
                          ),
                          SizedBox(
                            width: screenWidthMultiply(0.06, context),
                          ),
                          Text(
                            context.t!.autoDarkMode,
                            style: const TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
