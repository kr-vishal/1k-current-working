import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meme/database/helper.dart';
import 'package:meme/database/models/image_model.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageScanner extends StatefulWidget {
  const ImageScanner({super.key});

  @override
  _ImageScannerState createState() => _ImageScannerState();
}

class _ImageScannerState extends State<ImageScanner> {
  final MethodChannel _channel = const MethodChannel('image_scanner');
  List<String> _imagePaths = [];
  bool selecting = false;

  @override
  void initState() {
    super.initState();
    _getImagePaths();
  }

  Future<void> getPermissionRequest() async {
    List<Permission> permissions = [
      Permission.storage,
    ];

    //if ((await mediaStorePlugin.getPlatformSDKInt()) >= 33) {
    if (true) {
      permissions.add(Permission.photos);
      permissions.add(Permission.audio);
      permissions.add(Permission.videos);
    }

    await permissions.request();
  }

  Future<void> _getImagePaths() async {
    await getPermissionRequest();
    List<String> paths;
    try {
      final List<dynamic> result = await _channel.invokeMethod('getAllImages');
      paths = result.cast<String>();

      for (var i = 0; i < paths.length; i++) {
        final path = paths[i];

        final image = ImageModel(imagePath: path);
        await DatabaseHelper().insertImage(image);
      }
    } on PlatformException catch (e) {
      debugPrint("Failed to get image paths: '${e.message}'.");
      paths = [];
    }
    setState(() {
      _imagePaths = paths;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Retrieval'),
      ),
      body: SingleChildScrollView(
        child: GridView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            crossAxisCount: 2,
          ),
          itemCount: _imagePaths.length,
          itemBuilder: (context, index) {
            //log("images");
            //log(_images.toString());
            return InkWell(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.red, blurRadius: 1.0, spreadRadius: .2),
                    ]),
                child: Card(
                  child: Image.file(File(_imagePaths[index])),
                ),
              ),
              onTap: () {
                debugPrint("Clicked image");
                debugPrint(_imagePaths[index]);
              },
              onDoubleTap: () {
                debugPrint("Double tap");
              },
              onLongPress: () {
                setState(() {
                  selecting = !selecting;
                });
              },
              onTapUp: (value) {
                debugPrint(value.runtimeType.toString());
              },
            );
          },
        ),
      ),
    );
  }
}
