import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meme_buttler/services/image_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tflite_v2/tflite_v2.dart';

Future<bool> requestStoragePermission() async {
  final status = await Permission.storage.request();
  return status == PermissionStatus.granted;
}

Future loadModel() async {
  WidgetsFlutterBinding.ensureInitialized();
  Tflite.close();
  String res;
  res = (await Tflite.loadModel(
      model: "assets/model.tflite", labels: "assets/labels.txt"))!;
  debugPrint("Models loading status: $res");
}

Future<List<dynamic>?> imageClassification(File image) async {
  final List? recognitions = await Tflite.runModelOnImage(
    path: image.path,
    numResults: 6,
    threshold: 0.05,
    imageMean: 127.5,
    imageStd: 127.5,
  );

  return recognitions;
}

Future<void> getImagesAndClassify() async {
  loadModel().then((value) => {
        ImageScanner().getImages().then((images) async {
          for (var i = 0; i < images.length; i++) {
            // TO DO
            File image = File(images[i]);

            var classify = await imageClassification(image);
            await Future.delayed(Durations.long2);
            debugPrint("IMAGE Classification ${classify.toString()}");
          }
        })
      });
}
