import 'package:goscore/splashscreen.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ColorNotifire())],
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: splashscreen(),
        ),
      ),
    ),
  );
}
