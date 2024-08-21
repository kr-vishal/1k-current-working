import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageScanner {
  MethodChannel? channel;

  ImageScanner({this.channel}) {
    channel = const MethodChannel('image_scanner');
    getPermissionRequest();
  }

  Future<dynamic> getImages() async {
    return channel?.invokeMethod("getAllImages");
  }

  Future<void> getPermissionRequest() async {
    List<Permission> permissions = [
      Permission.storage,
    ];

    //if ((await mediaStorePlugin.getPlatformSDKInt()) >= 33) {
    if (true) {
      permissions.add(Permission.storage);
    }

    await permissions.request();
  }
}
