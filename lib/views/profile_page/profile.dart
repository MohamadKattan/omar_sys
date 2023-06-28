import 'package:flutter/material.dart';
import 'package:omar_system/app_info.dart';
import 'package:omar_system/size_config.dart';
import 'package:omar_system/views/profile_page/components/user_info.dart';
import '../../controllers/user_controller.dart';
import '../../services/provider.dart';
import '../errors/server_error.dart';
import 'components/email_verification.dart';
import 'components/profile_shimmer.dart';
import 'components/user_menu_list.dart';

class ProfilePage extends StatefulWidget {
  final VoidCallback? function;

  const ProfilePage({Key? key, this.function}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  refresh() {
    setState(() {});
  }

  @override
  void initState() {
    if (riverpod.read(profileFirstOpen.notifier).state) {
      userController.getUserData().then((v) {
        if (userController.profileHasErr) {
          widget.function!();
          refresh();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(context.t!.weHaveProblem)));
        } else {
          widget.function!=null?
          widget.function!():refresh();
          refresh();
          setState(() {
            riverpod.read(profileFirstOpen.notifier).state = false;
          });
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        constraints: const BoxConstraints(maxWidth: 650),
        child: RefreshIndicator(
          onRefresh: () async {
            userController.getUserData().then((v) {
              if (userController.profileHasErr) {
                widget.function!();
                refresh();
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(context.t!.weHaveProblem)));
              } else {
                widget.function!();
                refresh();
                setState(() {
                  riverpod.read(profileFirstOpen.notifier).state = false;
                });
              }
            });
            return Future<void>.delayed(const Duration(milliseconds: 1500));
          },
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if(userController.profileHasErr)
                const  ServerError(),

              if (userController.profileIsLoading && !userController.profileHasErr)
                const ProfileShimmer(),




              if (!userController.profileIsLoading && !userController.profileHasErr )
               UserInfo(user: userController.user,),


              if (!userController.profileIsLoading && userController.user.emailVerifiedAt == null )
              const EmailVerification(),

              if (!userController.profileIsLoading && !userController.profileHasErr )
               UserMenuList( refresh: refresh,),

              SizedBox(
                height: screenHeightMultiply(0.05, context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






