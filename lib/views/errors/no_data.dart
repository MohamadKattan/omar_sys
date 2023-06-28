import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:omar_system/app_info.dart';
import 'package:omar_system/size_config.dart';

class NoFollowUpData extends StatelessWidget {

  const NoFollowUpData({Key ?key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height:screenHeightMultiply(0.04, context)),
            SizedBox(
              height: screenHeightMultiply(0.12, context),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Icon(Iconsax.emoji_sad,size: screenWidthDivided(4, context),color: checkDarkTheme(context.m)  ? $mainDarkColor : $mainColor,) ,
              ),
            ),
            SizedBox(height: screenHeightMultiply(0.03, context)),
            const  Text('No Follow up for today!',
                textAlign: TextAlign.center,
                style:  TextStyle(
                  fontSize: 25,
                  height: 1.8,
                  fontWeight: FontWeight.w700,
                )),
            // SizedBox(height: screenHeightMultiply(0.02, context)),
            //  Text(context.t!.noProductToShowDes,
            //     textAlign: TextAlign.center, style: const TextStyle(height: 1.8)),
            SizedBox(height: screenHeightMultiply(0.03, context)),
            SizedBox(height: screenHeightMultiply(0.03, context)),


          ],
        ),
      ),
    );
  }
}



class NoData extends StatelessWidget {

  const NoData({Key ?key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height:screenHeightMultiply(0.04, context)),
            SizedBox(
              height: screenHeightMultiply(0.12, context),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Icon(Iconsax.emoji_sad,size: screenWidthDivided(4, context),color: checkDarkTheme(context.m)  ? $mainDarkColor : $mainColor,) ,
              ),
            ),
            SizedBox(height: screenHeightMultiply(0.03, context)),
            const  Text('No data to show here !',
                textAlign: TextAlign.center,
                style:  TextStyle(
                  fontSize: 25,
                  height: 1.8,
                  fontWeight: FontWeight.w700,
                )),
            // SizedBox(height: screenHeightMultiply(0.02, context)),
            //  Text(context.t!.noProductToShowDes,
            //     textAlign: TextAlign.center, style: const TextStyle(height: 1.8)),
            SizedBox(height: screenHeightMultiply(0.03, context)),
            SizedBox(height: screenHeightMultiply(0.03, context)),


          ],
        ),
      ),
    );
  }
}

// SvgPicture.asset('assets/icons/no_data.svg')