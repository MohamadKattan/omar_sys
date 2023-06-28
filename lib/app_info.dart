import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


//  ---------- App info ----------//

const $appName = 'omar_system';
const $appLink = 'https://omar.training/';
const $apiPassword = 'ps4tek_com_Zmnc2dT4C@qusBVmC@6cr6';
const $currency = '\$';

//  ---------- PaymentMethods ----------//

const $offlinePayment = true;
const $paddlePayment = true;

const cardMainTextStyle =
    TextStyle(fontSize: 14, fontWeight: FontWeight.w700, height: 2
        // color: Color(0xFF108DE8),

        );
const subCardMainTextStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w700,
  // height: 2
  // color: Color(0xFF108DE8),
);

//  ---------- App Colors ----------//

const $mainColor = Colors.black;
const $mainDarkColor = Colors.grey;
const $mainLightColor = Color(0xFFFFECDF);
final $secondaryColor = Colors.grey.withOpacity(0.3);

//  ---------- App Colors ----------//

const $homeNavBarColor = Colors.white;
const $homeNavBarDarkColor = Colors.black54;

const $homeNavBarTextColor = Colors.black54;
const $homeNavBarTextDarkColor = Colors.white;

//  ---------- AppBar Colors ----------//

const $homeSearchInput = Colors.white;
const $homeDarkSearchInput = Colors.black54;

const $homeCartIconColor = Colors.black;
const $homeCartDarkIconColor = Colors.white;

//  ---------- Profile Pic Colors ----------//

const $profilePicBackColor = Colors.white;
const $profilePicDarkBackColor = Colors.black54;

//  ---------- Profile Pic Colors ----------//

const $AccordionContentBackgroundColor = Colors.white;
const $AccordionContentDarkBackgroundColor = Colors.black54;

//  ---------- Shopping Card Colors ----------//

const $shoppingCardColor = Colors.white54;
const $shoppingCardDarkColor = Colors.black87;

//  ---------- Btn Colors ----------//

const $secondaryBtnTextColor = Colors.black;
const $secondaryBtnDarkTextColor = Colors.white54;

//  ---------- Border Colors ----------//

const $borderColor = Colors.black54;
const $borderDarkColor = Colors.white54;

//  ---------- Text Colors ----------//

const $textColor = Colors.black;
const $textDarkColor = Colors.white;

final $titleColor = Colors.black87.withOpacity(0.7);
final $DarkTitleColor = Colors.white.withOpacity(0.7);

const $borderRadius = 18;
const $imageBorderRadius = 6;

// ===========List api admin ===========

Map<String, dynamic>? dayFollowJson;

extension LocalizedBuildContext on BuildContext {
  AppLocalizations? get t => AppLocalizations.of(this);
  Locale get local => Localizations.localeOf(this);
}

extension ThemeBuildContext on BuildContext {
  Brightness get m => Theme.of(this).brightness;
}

checkDarkTheme<bool>(theme) {
  if (theme == Brightness.dark) {
    return true;
  }
  return false;
}
