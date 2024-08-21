package com.example.meme

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodChannel
import android.util.Log

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "image_scanner").setMethodCallHandler { call, result ->
            Log.d("TAG", call.method);
            if (call.method == "getAllImages") {
                Log.d("TAG", "implemented");
                ImageScanner(this).getAllImages(result)
            } else if (call.method == "classifyImage") {
                val arg1: String? = call.argument("arg1")
                val classifier = ImageClassifier(context, "mobilenet_v3.tflite")
                val imagePath = "image.jpg" // Replace with actual image path
                val result = classifier.classifyImage(imagePath)
            }
            else{
                Log.d("TAG", "Not implemented");
                result.notImplemented()
            }
        }
    }
}
