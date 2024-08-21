import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memes_classification/services/TFliteForeground.dart';
import 'package:tflite_v2/tflite_v2.dart';

class TfliteModel extends StatefulWidget {
  const TfliteModel({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TfliteModelState createState() => _TfliteModelState();
}

class _TfliteModelState extends State<TfliteModel> {
  late File _image;
  late List _results;
  bool imageSelect = false;
  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future loadModel() async {
    Tflite.close();
    String res;
    res = (await Tflite.loadModel(
        model: "assets/model.tflite", labels: "assets/labels.txt"))!;
    log("Models loading status: $res");
  }

  Future imageClassification(File image) async {
    final List? recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _results = recognitions!;
      _image = image;
      imageSelect = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 65, 19, 139),
        title: const Text("Memes Classification",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            (imageSelect)
                ? Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.file(_image),
                  )
                : Container(
                    margin: const EdgeInsets.all(10),
                    child: const Opacity(
                      opacity: 0.8,
                      child: Center(
                        child: Text(
                          "No image selected",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: (imageSelect)
                        ? _results.map((result) {
                            return Card(
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                child: Text(
                                  "${result['label']}",
                                  style: const TextStyle(
                                      color: Colors.red, fontSize: 20),
                                ),
                              ),
                            );
                          }).toList()
                        : [],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        TFliteForeground.startService();
                      },
                      child: const Text('Foreground')),
                  ElevatedButton(
                      onPressed: () {
                        TFliteForeground.stopService();
                      },
                      child: const Text('STOP Service'))
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImage,
        tooltip: "Pick Image",
        backgroundColor: const Color.fromARGB(255, 65, 19, 139),
        child: const Icon(
          Icons.image_outlined,
          color: Colors.white,
        ),
      ),
    );
  }

  Future pickImage() async {
    // ignore: no_leading_underscores_for_local_identifiers
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    File image = File(pickedFile!.path);
    imageClassification(image);
  }
}
