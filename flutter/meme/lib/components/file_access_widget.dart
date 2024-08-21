import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class FileAccessPermission extends StatelessWidget {
  final Function stateCallback;
  const FileAccessPermission({super.key, required this.stateCallback});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("In order to access file, please provide permission"),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () async {
              await takePemissions();

              if (await Permission.photos.isDenied) {
                openAppSettings();
              } else {
                stateCallback();
              }
            },
            child: const Text('Grant Permission')),
      ],
    );
  }

  Future<Map<Permission, PermissionStatus>> takePemissions() async {
    debugPrint("CALLING THIS");

    final androidInfo = await DeviceInfoPlugin().androidInfo;
    Map<Permission, PermissionStatus> statuses;
    var version = androidInfo.version.sdkInt;

    debugPrint('VERSION {$version}');
    if (androidInfo.version.sdkInt >= 33) {
      statuses = await [Permission.manageExternalStorage].request();
    } else {
      statuses = await [Permission.photos, Permission.storage].request();
    }

    return statuses;
  }
}
