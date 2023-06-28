import 'package:flutter/material.dart';
import 'package:omar_system/app_info.dart';
import 'package:omar_system/views/sign_up/components/sigin_up_form.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 650),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidthMultiply(0.05, context),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: screenWidthMultiply(0.10, context)), // 4%
                  Text(context.t!.createNewAccount,
                      style:
                          TextStyle(fontSize: screenWidthDivided(20, context))),
                  SizedBox(height: screenWidthMultiply(0.02, context)), // 4%
                  Text(context.t!.createNewAccountDes,
                      textAlign: TextAlign.center,
                      style: const TextStyle(height: 1.8)),
                  SizedBox(height: screenWidthMultiply(0.04, context)),
                  const SignUpForm(),
                  SizedBox(height: screenWidthMultiply(0.04, context)),
                  Text(
                    context.t!.termsConditionsAccept,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(height: screenWidthMultiply(0.04, context)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
