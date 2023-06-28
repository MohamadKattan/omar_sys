import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:omar_system/app_info.dart';

import '../../../size_config.dart';
import '../../change_password/change_pass_screen.dart';


class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: screenWidthMultiply(0.06, context),right: screenWidthMultiply(0.06, context)),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) =>  const ChangePassScreen(),
          ));

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
                    const Icon(Iconsax.password_check,),
                    SizedBox(width: screenWidthMultiply(0.06, context),),
                    Text(context.t!.changePassword,)
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
