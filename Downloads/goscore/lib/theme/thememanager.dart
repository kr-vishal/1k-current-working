// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'colors.dart';

class ColorNotifire with ChangeNotifier {
  bool isDark = false;
  set setIsDark(value) {
    isDark = value;
    notifyListeners();
  }

  get onboardingcolor1 =>
      isDark ? onboardingbackgrounddarkColor1 : onboardingbackgroundlightColor1;
  get onboardingcolor2 =>
      isDark ? onboardingbackgrounddarkColor2 : onboardingbackgroundlightColor2;
  get greytextcolor => isDark ? greydarkColor : greylightColor;
  get textcolor => isDark ? textdarkColor : textlightColor;
  get backgroundallscreencolor =>
      isDark ? backgrounddarkColor : backgroundlightColor;
  get bordercolor => isDark ? borderdarkColor : borderlightColor;
  get checkboxlistilecolor => isDark ? checkdarkColor : checkboxlightColor;
  get dialogtextcolor =>
      isDark ? dialogtextcolordarkColor : dialogtextcolorlightColor;
  get backgroundcolor2 => isDark ? backgrounddarkColor2 : backgroundlightColor2;
  get Linearindicatorcolor1 =>
      isDark ? LinearindicatorcolordarkColor1 : LinearindicatorcolorlightColor1;
  get onboardindicatorcolor =>
      isDark ? onboardindicatorcolordarkColor : onboardindicatorcolorlightColor;
}
