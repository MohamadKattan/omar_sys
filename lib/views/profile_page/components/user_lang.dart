import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:omar_system/app_info.dart';
import '../../../size_config.dart';
import '../../../widgets/select_lang.dart';

class UserLang extends StatefulWidget {
  const UserLang({Key? key}) : super(key: key);

  @override
  State<UserLang> createState() => _UserLangState();
}

class _UserLangState extends State<UserLang> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: screenWidthMultiply(0.06, context),right: screenWidthMultiply(0.06, context)),
      child: GestureDetector(
        onTap: (){
          // MyApp.setLocale(context, const Locale('en', ""));
          selectLang(context);
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
                    const Icon(Iconsax.language_circle),
                    SizedBox(width: screenWidthMultiply(0.06, context),),
                    Text(context.t!.appLanguage)
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

