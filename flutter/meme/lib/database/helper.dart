import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meme/database/models/image_model.dart';
import 'package:meme/services/tensorflow_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img; // For image decoding
import 'dart:ui' as ui;

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  factory DatabaseHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, 'meme_images.db');
    return openDatabase(
      databasePath,
      version: 1,
      onCreate: _createDb,
    );
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE images(
        id varchar(50) PRIMARY KEY,
        imagePath TEXT,
        isDeleted INTEGER CHECK (isDeleted IN (0, 1)) DEFAULT 0,
        isMeme INTEGER DEFAULT 0
      )
    ''');
  }

  Future<int> insertImage(ImageModel image) async {
    final db = await database;
    return db.insert('images', image.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<ImageModel>> getImages() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('images');
    return List.generate(maps.length, (i) {
      return ImageModel.fromMap(maps[i]);
    });
  }

  Future<int> deleteImage(int id) async {
    final db = await database;
    return db.delete(
      'images',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<ImageModel>> getPaginatedImages(int limit, int offset) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'images',
      limit: limit,
      offset: offset,
    );
    return List.generate(maps.length, (i) {
      return ImageModel.fromMap(maps[i]);
    });
  }
}

Future<void> getPermissions() async {
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

FutureOr<Uint8List> loadAsset(String assetPath) async {
  try {
    ByteData data = await rootBundle.load(assetPath);
    Uint8List bytes = data.buffer.asUint8List();
    // Now you have the file contents as bytes in the 'bytes' list
    // You can process the file contents as needed
    return bytes;
  } catch (e) {
    debugPrint('Error loading asset: $e');
  }

  return Uint8List.fromList([0]);
}

Future<int> isImageMeme(String imagePath, dynamic modelFile) async {
  TensorflowService _tensorflowService = TensorflowService();
  List<Uint8List> image = await imageToListOfUint8List(imagePath);
  await _tensorflowService.loadModel();
  List<dynamic>? recog = await _tensorflowService.runModel(image);
  debugPrint(recog.toString());
  bool isMeme = false;

  return isMeme ? 1 : 0;
}

Future<List<Uint8List>> imageToListOfUint8List(String imagePath) async {
  // Load the image from file
  File file = File(imagePath);
  Uint8List bytes = await file.readAsBytes();

  // Decode the image
  ui.Image image = await decodeImageFromList(bytes);

  // Convert the image to byte data
  ByteData? byteData = await image.toByteData();

  // Split the byte data into chunks of Uint8List
  List<Uint8List> chunks = [];
  int chunkSize = 1024; // Adjust this value as needed
  for (int i = 0; i < byteData!.lengthInBytes; i += chunkSize) {
    int end = i + chunkSize < byteData.lengthInBytes
        ? i + chunkSize
        : byteData.lengthInBytes;
    Uint8List chunk = byteData.buffer.asUint8List(i, end);
    chunks.add(chunk);
  }

  return chunks;
}

Future<int> isImageMemeOld(String imagePath, dynamic modelFile) async {
  File image = File(imagePath);
  late Interpreter interpreter;
  final inputImageData = await _getImageData(image);

  //final modelFile = await loadAsset('assets/meme_model.tflite');
  interpreter = await Interpreter.fromAsset("models/meme_model.tflite");

  // ignore: prefer_typing_uninitialized_variables
  var output = List.filled(1, Float32List(4));
  interpreter.run(inputImageData, output);

  // Assuming a simple binary classification (e.g., 0 for non-meme, 1 for meme)
  final prediction = output[0][0];
  final isMeme = prediction > 0.5;

  return isMeme ? 1 : 0;
}

Future<Uint8List> getImageData(File image) async {
  return image.readAsBytes();
}

Future<List<Float32List>> _getImageData(File imageData) async {
  final imageBytes = await imageData.readAsBytes();
  // Decode image
  img.Image image = img.decodeImage(imageBytes)!;
  // Resize image to fit model input shape
  img.Image resizedImage = img.copyResize(image, width: 224, height: 224);
  // Convert image to TensorFlow Lite input format (Float32List)
  var input = resizedImage.getBytes();
  // Normalize pixel values to be between 0 and 1
  var inputFloat32List =
      Float32List.fromList(input.map((e) => e / 255.0).toList());
  // Run inference

  return [inputFloat32List];
}
