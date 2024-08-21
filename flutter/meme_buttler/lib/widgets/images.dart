import 'package:flutter/material.dart';
import 'package:meme_buttler/services/handler.dart';
import 'package:meme_buttler/services/image_scanner.dart';

class Images extends StatefulWidget {
  const Images({super.key});

  @override
  State<Images> createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("SHOWING IMAGES"),
          ElevatedButton(
              onPressed: () async {
                getImagesAndClassify();
              },
              child: const Text("Get Images"))
        ],
      ),
    ));
  }
}
