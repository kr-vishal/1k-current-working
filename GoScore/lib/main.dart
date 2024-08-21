import 'package:goscore/includes/navigation_service.dart';
import 'package:goscore/login.dart';
import 'package:goscore/onboarding.dart';
import 'package:goscore/signup.dart';
import 'package:goscore/splashscreen.dart';
import 'package:goscore/tabbar.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ColorNotifire())],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigationService.navigatorKey,
        home: const Scaffold(
          body: splashscreen(),
        ),
        routes: {
          "/login": (context) => const login(),
          "/onboarding": (context) => const onboarding(),
          "/signup": (context) => const signup(),
          "/home": (context) => const tabbar()
        },
      ),
    ),
  );
}
