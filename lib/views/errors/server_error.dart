import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omar_system/app_info.dart';
import 'package:omar_system/size_config.dart';

class ServerError extends StatelessWidget {

  const ServerError({Key ?key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height:screenHeightMultiply(0.10, context)),
            Text(context.t!.weHaveErrorMsg,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  height: 1.8,
                  fontWeight: FontWeight.w700,
                )),
            SizedBox(height: screenHeightMultiply(0.02, context)),

            SizedBox(
              height: screenHeightMultiply(0.30, context),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: SvgPicture.asset('assets/images/error-lost-in-space.svg',width: double.infinity,height: screenHeightMultiply(0.20,context),) ,
              ),
            ),
            SizedBox(height: screenHeightMultiply(0.03, context)),

            Text(context.t!.weHaveErrorDes,
                textAlign: TextAlign.center, style: const TextStyle(height: 1.8)),

            SizedBox(height: screenHeightMultiply(0.02, context)),

            SizedBox(height: screenHeightMultiply(0.03, context)),
          ],
        ),
      ),
    );
  }
}
// SvgPicture.asset('assets/images/error-lost-in-space.svg')