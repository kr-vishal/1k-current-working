import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:goscore/followleague.dart';
import 'package:goscore/includes/api.dart';
import 'package:goscore/includes/auth.dart';
import 'package:goscore/includes/navigation_service.dart';

void googleLoginAndRedirect() async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? response = await googleSignIn.signIn();

  ApiRequest()
      .register(
          email: response!.email, name: response.displayName, socialLogin: true)
      .then((value) {
    if (value.containsKey('access_token')) {
      Auth().login(data: value['access_token']).then((value) {
        Get.to(() => const followleague(), popGesture: true);
      });
    }
  });
}

dynamic navigateScreenNamed(String routeName, {bool replace = false}) {
  GlobalKey<NavigatorState> navigatorKey = NavigationService.navigatorKey;
  if (replace) {
    navigatorKey.currentState?.pushReplacementNamed(routeName);
  } else {
    navigatorKey.currentState?.pushNamed(routeName);
  }
}
