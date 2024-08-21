import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _image;
  late Interpreter _interpreter;

  @override
  void initState() {
    super.initState();
    _loadModel();
  }

  Future<void> _loadModel() async {
    try {
      final modelFile = await File('assets/meme_model.tflite').readAsBytes();
      _interpreter = Interpreter.fromBuffer(modelFile);
    } catch (e) {
      log('Error loading model: $e');
    }
  }

  Future<void> _classifyImage() async {
    // ignore: unnecessary_null_comparison
    if (_image == null || _interpreter == null) return;

    try {
      final inputImageData = await _getImageData();
      // ignore: prefer_typing_uninitialized_variables
      var output;
      _interpreter.run(inputImageData, output);

      // Assuming a simple binary classification (e.g., 0 for non-meme, 1 for meme)
      final prediction = output[0][0];
      final isMeme = prediction > 0.5;

      final resultMessage = isMeme ? 'Meme Detected!' : 'Not a Meme.';

      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Meme Detection Result'),
            content: Text(resultMessage),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      log('Error classifying image: $e');
    }
  }

  Future<List<List<List<List<double>>>>> _getImageData() async {
    final imageBytes = await _image!.readAsBytes();
    final ByteData byteData =
        ByteData.sublistView(Uint8List.fromList(imageBytes));
    return [List.from(byteData.buffer.asFloat32List())];
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = pickedFile != null ? File(pickedFile.path) : null;
    });

    if (_image != null) {
      _classifyImage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meme Detection App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? const Text('Select an image')
                : Image.file(
                    _image!,
                    height: 200.0,
                  ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Pick Image'),
            ),
          ],
        ),
      ),
    );
  }
}
