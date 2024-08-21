import 'package:flutter/material.dart';
import 'package:meme/screens/background.dart';
import 'package:meme/screens/image_scanner.dart';
import 'package:meme/screens/images.dart';
import 'package:meme/screens/media_store.dart';
import 'package:meme/screens/media_store/ImageSaveScreen.dart';
import 'package:meme/screens/meme_image.dart';
import 'package:meme/screens/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meme Images',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      initialRoute: "/home",
      routes: {
        "/home": (context) => const SplashScreen(),
        "/background": (context) => const Background(),
        "/meme": (context) => const MyHomePage(),
        "/images": (context) => ImagesWidget(),
        "/media-store": (context) => const MediaStoreWidget(),
        "/image-scanner": (context) => const ImageScanner()
      },
    );
  }
}
