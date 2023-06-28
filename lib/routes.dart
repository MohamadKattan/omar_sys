import 'package:flutter/material.dart';
import 'package:omar_system/views/admin_home.dart';
import 'package:omar_system/views/admin_page/admin_main.dart';
import 'package:omar_system/views/change_password/change_pass_screen.dart';
import 'package:omar_system/views/courses_page/courses_page.dart';
import 'package:omar_system/views/edit_profile/edit_profile.dart';
import 'package:omar_system/views/email_verification_page/email_verification_page.dart';
import 'package:omar_system/views/forgot_password/forgot_password_screen.dart';
import 'package:omar_system/views/sections_page/sections_show_page/sections_show_page.dart';
import 'package:omar_system/views/sign_in/sign_in_screen.dart';
import 'package:omar_system/views/sign_up/sign_up_screen.dart';

import 'app_layout.dart';

final Map<String, WidgetBuilder> routes = {
  AppLayout.routeName: (context) => const AppLayout(),
  Home.routeName: (context) => const Home(),
  AdminOrHome.routeName: (context) => const AdminOrHome(),
  AdminMainPage.routeName: (context) => const AdminMainPage(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  CoursesPage.routeName: (context) => const CoursesPage(),
  ChangePassScreen.routeName: (context) => const ChangePassScreen(),
  EditProfileScreen.routeName: (context) => const EditProfileScreen(),
  EmailVerificationPage.routeName: (context) => const EmailVerificationPage(),
  SectionsShow.routeName: (context) => const SectionsShow(),
};
