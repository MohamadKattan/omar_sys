import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:omar_system/app_info.dart';
import 'package:omar_system/controllers/user_controller.dart';
import '../../../app_layout.dart';
import '../../../controllers/home_controller.dart';
import '../../../services/databasehelper.dart';
import '../../../services/functions.dart';
import '../../../services/provider.dart';
import '../../../size_config.dart';

class UserLogOut extends StatefulWidget {
  const UserLogOut({Key? key}) : super(key: key);

  @override
  State<UserLogOut> createState() => _UserLogOutState();
}

class _UserLogOutState extends State<UserLogOut> {
  bool logOut = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: screenWidthMultiply(0.06, context),
          right: screenWidthMultiply(0.06, context)),
      child: GestureDetector(
        onTap: () {
          setState(() {
            logOut = true;
          });
          databaseHelper.logOut().then((v) {
            setState(() {
              riverpod.read(homeFirstOpen.notifier).state = true;
              riverpod.read(myCourseFirstOpen.notifier).state = true;
              riverpod.read(profileFirstOpen.notifier).state = true;
              riverpod.read(selectedIndex.notifier).state = 0;
              riverpod.read(inCartNumber.notifier).state = 0;
              homeController.isLoading = true;
              // shoppingCartController.inCartCoursesList.clear();
              userController.userEnrolledCoursesList.clear();
              // shoppingCartController.isLoading = true;
              userController.isLoading = true;
            });

            if (v == false) {
              functions.tokenState().then((value) => setState(() {
                    riverpod.read(tokenState.notifier).state = value;
                  }));
              Navigator.pushReplacement<void, void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const AppLayout(),
                ),
              );
            } else {
              setState(() {
                logOut = false;
              });
              final snackBar = SnackBar(
                content: const Text("حدث خطأ ما يرجى المحاولة مرة اخرى  .. "),
                action: SnackBarAction(
                  label: '',
                  onPressed: () {},
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          });
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
                    !logOut
                        ? const Icon(
                            Iconsax.logout,
                            color: Colors.deepOrange,
                          )
                        : const Center(
                            child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator())),
                    SizedBox(
                      width: screenWidthMultiply(0.06, context),
                    ),
                    Text(
                      context.t!.signOut,
                      style: const TextStyle(color: Colors.deepOrange),
                    )
                  ],
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
