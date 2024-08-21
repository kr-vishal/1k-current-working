import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:meme_buttler/helpers/navigate.dart';
import 'package:meme_buttler/screens/splash.dart';

class SplashEntry extends StatefulWidget {
  const SplashEntry({super.key});

  @override
  State<SplashEntry> createState() => _SplashEntryState();
}

class _SplashEntryState extends State<SplashEntry> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4)).then((value) {
      goToReplace('images');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color(0xFF0B0C0B),
          body: Stack(
            children: <Widget>[
              Center(
                  child: WidgetRingAnimator(
                size: 120,
                ringIcons: const [
                  'assets/cart.png',
                  'assets/delivery.png',
                  'assets/cart.png',
                  'assets/delivery.png',
                ],
                ringIconsSize: 3,
                ringIconsColor: Colors.green,
                ringAnimation: Curves.linear,
                ringColor: Colors.green,
                reverse: false,
                ringAnimationInSeconds: 10,
                child: Container(
                  child: Material(
                    elevation: 8.0,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 45.0,
                      child: Image.asset(
                        'assets/app_logo.png',
                        color: Colors.green,
                        height: 65,
                      ),
                    ),
                  ),
                ),
              )),
              Center(
                child: AvatarGlow(
                  glowColor: Colors.lightGreen,
                  endRadius: 200.0,
                  duration: const Duration(milliseconds: 2000),
                  repeat: true,
                  showTwoGlows: true,
                  repeatPauseDuration: const Duration(milliseconds: 100),
                  child: Material(
                    elevation: 8.0,
                    shape: const CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 45.0,
                      child: Image.asset(
                        'assets/app_logo.png',
                        color: Colors.green,
                        height: 65,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
