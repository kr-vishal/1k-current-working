import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TFliteForeground {
  static const MethodChannel _channel = MethodChannel('example_service');

  static Future<void> startService() async {
    try {
      await _channel.invokeMethod('startExampleService');
    } on PlatformException catch (e) {
      debugPrint("Failed to start service: '${e.message}'.");
    }
  }

  static Future<void> stopService() async {
    try {
      final result = await _channel.invokeMethod('stopExampleService');
    } on PlatformException catch (e) {
      debugPrint("Failed to invoke method: '${e.message}'.");
    }
  }

  // Add other methods for TFLite inference and service control
}
