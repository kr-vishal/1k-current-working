// ignore_for_file: camel_case_types

import 'dart:async';
import 'package:goscore/includes/auth.dart';
import 'package:goscore/includes/functions.dart';
import 'package:goscore/stringfile.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'media.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  late ColorNotifire notifire;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  @override
  void initState() {
    super.initState();
    getdarkmodepreviousstate();
    Timer(
        const Duration(seconds: 4),
        () async => navigateScreenNamed(
            (await Auth().isLoggedIn()) ? "/home" : "/onboarding",
            replace: true));
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff0038D9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/applogo.png",
              scale: 16,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              Apptext.gosocre,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
