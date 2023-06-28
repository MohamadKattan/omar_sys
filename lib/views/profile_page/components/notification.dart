import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:iconsax/iconsax.dart';
import 'package:omar_system/app_info.dart';

import '../../../size_config.dart';

class AppNotificationSwitch extends StatefulWidget {
  const AppNotificationSwitch({Key? key}) : super(key: key);

  @override
  State<AppNotificationSwitch> createState() => _AppNotificationSwitchState();
}

class _AppNotificationSwitchState extends State<AppNotificationSwitch> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: screenWidthMultiply(0.06, context),right: screenWidthMultiply(0.06, context)),
      child: GestureDetector(
        onTap: (){

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
                    const Icon(Iconsax.notification,),
                    SizedBox(width: screenWidthMultiply(0.06, context),),
                    Text(context.t!.notification,)
                  ],
                ),
                FlutterSwitch(
                  width: 50.0,
                  height: 25.0,
                  valueFontSize: 15.0,
                  toggleSize: 20.0,
                  value: isActive,
                  borderRadius: 30.0,
                  showOnOff: false,
                  onToggle: (val) {
                    setState(() {
                      isActive = val;
                    });
                  },
                ),

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

