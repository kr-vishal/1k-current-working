import 'dart:io';
import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_isolate/flutter_isolate.dart';
import 'package:meme/database/helper.dart';
import 'package:meme/database/models/image_model.dart';

Future<List<int>> loadAsset(String assetPath) async {
  try {
    ByteData data = await rootBundle.load(assetPath);
    List<int> bytes = data.buffer.asUint8List();
    // Now you have the file contents as bytes in the 'bytes' list
    // You can process the file contents as needed
    return bytes;
  } catch (e) {
    debugPrint('Error loading asset: $e');
    return [0];
  }
}

Future<void> findImagesInBackground(
    VoidCallback pendingCallback, VoidCallback doneCallback) async {
  debugPrint("BEFORE IN BACKGROUND");
  RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;
  debugPrint("AFTER IN BACKGROUND");
  final ReceivePort receivePort = ReceivePort();
  const MethodChannel channel = MethodChannel('image_scanner');
  await getPermissions();
  debugPrint('Background Task called');
  final List<dynamic> result = await channel.invokeMethod('getAllImages');
  final modelFile = await loadAsset("models/meme_model.tflite");
  //final modelFile = await File('models/meme_model.tflite').readAsBytes();
  // Start the background isolate
  final FlutterIsolate flutterIsolate = await FlutterIsolate.spawn(
    backgroundTask,
    {
      "sendPort": receivePort.sendPort,
      "imageResult": result,
      "modelFile": modelFile,
      //"rootIsolateToken": rootIsolateToken
    },
  );

  pendingCallback();

  //final List<dynamic> result = await channel.invokeMethod('getAllImages');

  debugPrint("CALLED");

  List<ImageModel> images = await DatabaseHelper().getImages();

  debugPrint("Images from DB ${images.length}");

  // Listen for messages from the background isolate
  receivePort.listen((dynamic message) {
    debugPrint('Background Task Message: ${message.toString()}');

    doneCallback();
    // Stop the background isolate after receiving a message
    flutterIsolate.kill();
  });
}

Future<bool> findAndUpdateImages() async {
  try {
    debugPrint("Started image find");

    return true;
  } on PlatformException catch (e) {
    debugPrint("Failed to get image paths: '${e.message}'.");

    return false;
  }
}

void backgroundTask(Map<String, dynamic> context) async {
  WidgetsFlutterBinding.ensureInitialized();
  SendPort sendPort = context['sendPort'];
  var modelFile = context['modelFile'];
  debugPrint("BEFORE COMING IN BACKGROUND");
  //RootIsolateToken rootIsolateToken = context['rootIsolateToken'];
  RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;
  debugPrint("COMING IN BACKGROUND");
  BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);
  final List<dynamic> result = context['imageResult'];
  List<String> paths;

  debugPrint('Background Task Started 1');

  paths = result.cast<String>();
  debugPrint("Images from isolate ${paths.toString()}");
  const MethodChannel channel = MethodChannel('image_scanner');

  for (var i = 0; i < paths.length; i++) {
    final path = paths[i];
    //final int isMeme = await isImageMeme(path, modelFile);
    final dynamic result = await channel.invokeMethod("getAllImages", path);
    debugPrint(result.toString());
    //final image = ImageModel(imagePath: path, isMeme: isMeme);
    //await DatabaseHelper().insertImage(image);
  }

  sendPort.send(true);
  //await findAndUpdateImages();
}
