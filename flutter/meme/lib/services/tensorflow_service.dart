import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image/image.dart' as img;

// singleton class used as a service
class TensorflowService {
  // singleton boilerplate
  static final TensorflowService _tensorflowService =
      TensorflowService._internal();

  factory TensorflowService() {
    return _tensorflowService;
  }
  // singleton boilerplate
  TensorflowService._internal();

  StreamController<List<dynamic>> _recognitionController = StreamController();
  Stream get recognitionStream => _recognitionController.stream;

  bool _modelLoaded = false;

  Future<void> loadModel() async {
    try {
      //_recognitionController.add(null);
      await Tflite.loadModel(
        model: "models/meme_model.tflite",
        labels: "models/v3_lables.txt",
      );
      _modelLoaded = true;
    } catch (e) {
      debugPrint('error loading model');
      debugPrint(e.toString());
    }
  }

  Future<List<dynamic>?> runModel(List<Uint8List> image) async {
    if (_modelLoaded) {
      List? recognitions = await Tflite.runModelOnFrame(
        bytesList: image, // required
        //imageHeight: image.height,
        //imageWidth: image.width,
        numResults: 3,
      );

      return recognitions;
      // shows recognitions on screen
      if (recognitions!.isNotEmpty) {
        debugPrint(recognitions[0].toString());
        if (_recognitionController.isClosed) {
          // restart if was closed
          _recognitionController = StreamController();
        }
        // notify to listeners
        _recognitionController.add(recognitions);
      }
    }

    return null;
  }

  Future<void> stopRecognitions() async {
    if (!_recognitionController.isClosed) {
      //_recognitionController.add(null);
      _recognitionController.close();
    }
  }

  void dispose() async {
    _recognitionController.close();
  }
}
