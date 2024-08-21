import 'package:flutter/material.dart';
import 'package:memes_classification/TfliteModel.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    handlrData(context);
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 65, 19, 139),
      body: SafeArea(
          child: Center(
        child: Text(
          "Memes Classification",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      )),
    );
  }

  Future<void> handlrData(context) async {
    await Future.delayed(const Duration(seconds: 8));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const TfliteModel()));
  }
}
