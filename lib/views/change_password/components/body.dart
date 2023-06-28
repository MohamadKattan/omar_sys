import 'package:flutter/material.dart';
import 'package:omar_system/app_info.dart';
import '../../../size_config.dart';
import 'change_pass_form.dart';

class Body extends StatelessWidget {
  const Body({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: screenWidthDivided(20, context)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: screenHeightMultiply(0.04, context)), // 4%
                Text(context.t!.changePassword, style: TextStyle(fontSize: screenWidthDivided(15, context),)),
                SizedBox(height: screenHeightMultiply(0.02, context)), // 4%

                Text(context.t!.youCanChangePasswordFromHere,
                    textAlign: TextAlign.center, style: const TextStyle(height: 1.8)),
                SizedBox(height: screenHeightMultiply(0.04, context)),
                const ChangePasswordForm(),
                SizedBox(height: screenHeightMultiply(0.04, context)),

                SizedBox(height: screenHeightMultiply(0.06, context)),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

