import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:media_store_plus/media_store_plus.dart';
import 'package:meme/screens/media_store/ReadWriteScreenAPI33OrUp.dart';
import 'package:permission_handler/permission_handler.dart';
import "../screens/media_store/ImageSaveScreen.dart";

final mediaStorePlugin = MediaStore();

class MediaStoreWidget extends StatefulWidget {
  const MediaStoreWidget({super.key});

  @override
  State<MediaStoreWidget> createState() => _MediaStoreWidgetState();
}

class _MediaStoreWidgetState extends State<MediaStoreWidget> {
  int _platformSDKVersion = 0;

  @override
  void initState() {
    super.initState();
    getPermissionRequest();
    initPlatformState();
  }

  Future<void> getPermissionRequest() async {
    List<Permission> permissions = [
      Permission.storage,
    ];

    if ((await mediaStorePlugin.getPlatformSDKInt()) >= 33) {
      permissions.add(Permission.photos);
      permissions.add(Permission.audio);
      permissions.add(Permission.videos);
    }

    await permissions.request();

    // You have set this otherwise it throws AppFolderNotSetException
    MediaStore.appFolder = "MediaStorePlugin";
  }

  Future<void> initPlatformState() async {
    int platformSDKVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformSDKVersion = await mediaStorePlugin.getPlatformSDKInt() ?? 0;
    } on PlatformException {
      platformSDKVersion = -1;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformSDKVersion = platformSDKVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('media_store_plus_example'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(text: 'Running on: ', children: [
                TextSpan(
                    text: _platformSDKVersion.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Save file in...',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ImageSaveScreen();
                }));
              },
              child: const Text("Image Folder"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ReadWriteScreenAPI33OrUp();
                }));
              },
              child: const Text("Read/Write API 33 or Upper Folder"),
            ),
          ],
        ),
      ),
    );
  }
}
