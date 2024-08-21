import 'dart:developer';
import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:meme/components/file_access_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool filePermissionGranted = false;
  List<String> _exPath = [];
  List<String> _images = [];
  bool selecting = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (filePermissionGranted && _exPath.isEmpty) {
      getPath();
      getPublicDirectoryPath();
    }

    if (_exPath.isNotEmpty) {
      var path = _exPath.map((e) {
        var directory = Directory("/storage/emulated/0/Android");
        var files = directory.listSync(followLinks: false, recursive: true);
        return files
            .map((e) => e.path)
            .where((e) =>
                e.endsWith('jpg') || e.endsWith('png') || e.endsWith('jpeg'))
            .toList();
      }).toList();

      _images = [];
      for (var element in path) {
        _images.addAll(element);
      }
      //_images.addAll(path);
    }
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the DashboardScreen object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: filePermissionGranted
            ? _exPath.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/background');
                          },
                          child: const Text('Background')),
                      selecting
                          ? const Text("Selected")
                          : const Text("Selecting"),
                      SingleChildScrollView(
                        child: GridView.builder(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                            crossAxisCount: 2,
                          ),
                          itemCount: _images.length,
                          itemBuilder: (context, index) {
                            //log("images");
                            //log(_images.toString());
                            return InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.red,
                                          blurRadius: 20.0,
                                          spreadRadius: 1),
                                    ]),
                                child: Card(
                                  child: Image.file(File(_images[index])),
                                ),
                              ),
                              onTap: () {
                                log("Clicked image");
                                log(_images[index]);
                              },
                              onDoubleTap: () {
                                log("Double tap");
                              },
                              onLongPress: () {
                                setState(() {
                                  selecting = !selecting;
                                });
                              },
                              onTapUp: (value) {
                                log(value.runtimeType.toString());
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  )
            : Center(
                // Center is a layout widget. It takes a single child and positions it
                // in the middle of the parent.
                child: FileAccessPermission(
                stateCallback: () =>
                    {setState(() => filePermissionGranted = true)},
              ) // This trailing comma makes auto-formatting nicer for build methods.
                ));
  }

  Future<void> getPath() async {
    List<String> paths;
    // getExternalStorageDirectories() will return list containing internal storage directory path
    // And external storage (SD card) directory path (if exists)
    paths = await ExternalPath.getExternalStorageDirectories();

    setState(() {
      _exPath = paths; // [/storage/emulated/0, /storage/B3AE-4D28]
    });
  }

  // To get public storage directory path like Downloads, Picture, Movie etc.
  // Use below code
  Future<void> getPublicDirectoryPath() async {
    String path;

    path = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);

    setState(() {
      debugPrint(path); // /storage/emulated/0/Download
    });
  }
}
