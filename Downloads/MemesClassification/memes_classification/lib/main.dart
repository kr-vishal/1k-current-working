import 'package:flutter/material.dart';
import 'package:memes_classification/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Memes Classification',
      theme: ThemeData(useMaterial3: true),
      home: const SplashScreen(),
    );
  }
}
