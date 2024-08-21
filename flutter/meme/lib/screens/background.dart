import 'package:flutter/material.dart';
import 'package:meme/module/find_images_bg.dart';

class Background extends StatefulWidget {
  const Background({super.key});

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  bool isBackgroundRunning = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Background Task Example'),
      ),
      body: Center(
        child: RefreshIndicator(
          onRefresh: () => findImages(),
          backgroundColor: Colors.amber,
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isBackgroundRunning
                      ? const CircularProgressIndicator()
                      : const Text(""),
                  ElevatedButton(
                    onPressed: () async {
                      findImages();
                    },
                    child: const Text('Run Background Task'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  findImages() async {
    findImagesInBackground(() {
      setState(() {
        isBackgroundRunning = true;
      });
    }, () {
      setState(() {
        isBackgroundRunning = false;
      });
    });
  }
}
