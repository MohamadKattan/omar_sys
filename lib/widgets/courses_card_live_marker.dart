import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:omar_system/app_info.dart';

import '../size_config.dart';


class LiveMarker extends StatelessWidget {
  const LiveMarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      key: key,
      top: 10,
      right: 10,
      child: Container(
        width: 70,
        height: 25,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidthDivided(45, context),
            right: screenWidthDivided(45, context),
            top: screenWidthDivided(55, context),
            bottom: screenWidthDivided(55, context),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              AutoSizeText(
                context.t!.live,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidthDivided(85, context)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
