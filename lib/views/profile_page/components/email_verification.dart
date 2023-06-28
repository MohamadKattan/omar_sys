import 'package:flutter/material.dart';
import 'package:omar_system/app_info.dart';
import 'package:omar_system/controllers/user_controller.dart';
import '../../../size_config.dart';
import '../../email_verification_page/email_verification_page.dart';

// class EmailVerification extends StatelessWidget {
//   final String? email;
//   const EmailVerification({Key? key, this.email}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//
//         ],
//       ),
//     );
//   }
// }


class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  State<EmailVerification> createState() => _UserLangState();
}

class _UserLangState extends State<EmailVerification> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: screenWidthMultiply(0.06, context),right: screenWidthMultiply(0.06, context)),
      child: GestureDetector(
        onTap: (){

        },
        child:   Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeightMultiply(0.04, context)),
            Text(
              context.t!.pleaseConfirmEmailToUseApp,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeightMultiply(0.02, context)),
            Text(context.t!.confirmEmailSent,textAlign: TextAlign.center,),
            SizedBox(height: screenHeightMultiply(0.02, context)),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => EmailVerificationPage(
                      email: userController.user.email,
                    ),
                  ),
                );
              },
              child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Center(
                      child: Text(
                        context.t!.confirmYourAccountNow,
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )),
            ),
            SizedBox(height: screenHeightMultiply(0.04, context)),
          ],
        ),
      ),
    );
  }
}


