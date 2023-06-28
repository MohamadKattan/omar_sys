import 'package:flutter/material.dart';
import 'package:omar_system/views/profile_page/components/theme_mode.dart';
import 'package:omar_system/views/profile_page/components/edit_user.dart';
import 'package:omar_system/views/profile_page/components/user_log_out.dart';
import 'package:omar_system/views/profile_page/components/change_password.dart';

class UserMenuList extends StatelessWidget {
  final VoidCallback? refresh;

  const UserMenuList({Key? key, required this.refresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserEdit(
          refresh: refresh,
        ),
        const ChangePassword(),
        // const UserLang(),
        const ChangeAppThemeMode(),
        // const AppNotificationSwitch(),
        const UserLogOut(),
      ],
    );
  }
}
