//  nav bar

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../../app_info.dart';
import '../../../services/provider.dart';
import '../../../size_config.dart';

Widget navBar(BuildContext context, PageController? controllerView) {
  return Container(
    decoration: BoxDecoration(
      color:
          checkDarkTheme(context.m) ? $homeNavBarDarkColor : $homeNavBarColor,
      boxShadow: [
        BoxShadow(
          blurRadius: 20,
          color: Colors.black.withOpacity(.1),
        )
      ],
    ),
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
        child: GNav(
          mainAxisAlignment: isMobile(context)
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          rippleColor: checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
          hoverColor: checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
          gap: screenWidthDivided(45, context),
          activeColor: Colors.white,
          iconSize: screenWidthDivided(18, context),
          padding: EdgeInsets.symmetric(
              horizontal: screenWidthDivided(25, context), vertical: 8),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor:
              checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
          color: checkDarkTheme(context.m)
              ? $homeNavBarTextDarkColor
              : $homeNavBarTextColor,
          tabBorderRadius: $borderRadius.toDouble(),
          textStyle: TextStyle(
              fontSize: screenWidthDivided(25, context), color: Colors.white),
          tabs: [
            GButton(
              icon: Iconsax.home,
              text: context.t!.homeAdmin,
              onPressed: () {
                context.read<ProviderListiner>().updateInedxOfPageView(0);
              },
            ),
            GButton(
              icon: Iconsax.profile_2user,
              text: context.t!.agentsAdmin,
              onPressed: () {
                context.read<ProviderListiner>().updateInedxOfPageView(1);
              },
            ),
            GButton(
              icon: Icons.attach_money,
              text: context.t!.navBilling,
              onPressed: () {
                context.read<ProviderListiner>().updateInedxOfPageView(2);
              },
            ),
            GButton(
              icon: Icons.monetization_on_rounded,
              text: context.t!.commision,
              onPressed: () {
                context.read<ProviderListiner>().updateInedxOfPageView(3);
              },
            ),
            GButton(
              icon: Iconsax.call,
              text: context.t!.navEffort,
              onPressed: () {
                context.read<ProviderListiner>().updateInedxOfPageView(4);
              },
            ),
          ],
          selectedIndex: context.watch<ProviderListiner>().indexPageView,
          // selectedIndex: riverpod.read(selectedIndex),
          onTabChange: (index) {
            controllerView?.animateToPage(
                context.read<ProviderListiner>().indexPageView,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          },
        ),
      ),
    ),
  );
}
