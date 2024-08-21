import 'dart:async';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:meme_buttler/screens/splash.dart';
import 'package:meme_buttler/screens/splash_entry.dart';
import 'package:meme_buttler/services/global.dart';
import 'package:meme_buttler/services/image_scanner.dart';
import 'package:meme_buttler/widgets/images.dart';
import 'package:tflite_v2/tflite_v2.dart';

FirebaseMessaging messaging = FirebaseMessaging.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyBk_-k97xaE-C7KkissxYuJ2R1kdsZ-1Vo",
    appId: "1:449718622562:android:ea58489a862530e285743b",
    messagingSenderId: "449718622562",
    projectId: "meme-33d64",
  ));

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  String? token = await FirebaseMessaging.instance.getToken();

  registerPort();

  runApp(const MyApp());
}

void configureFirebaseMessaging() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    // Handle the incoming message when the app is in the foreground
    // Execute the code you want here
    executeCodeOnNotification(message);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    // Handle the message when the app is in the background and the user taps on the notification
    // Execute the code you want here
    executeCodeOnNotification(message);
  });
}

bool stringToBool(String value) {
  // Convert the string to lowercase and trim any surrounding whitespace
  final lowerValue = value.trim().toLowerCase();

  // Check the value and return true for "true" or "1"
  if (lowerValue == 'true' || lowerValue == '1') {
    return true;
  }

  // Return false for "false" or "0" or any other value
  return false;
}

void _backgroundIsolateFunction(RemoteMessage message) async {
  // Initialize MethodChannel in the new isolate

  try {
    loadModel();
  } catch (e) {
    debugPrint('Error invoking method: $e');
  }

  // Load model (example)
  // Assuming you have a function to load the model
  // await loadModelInBackground();
}

// Register a port in the main isolate
void registerPort() {
  final receivePort = ReceivePort();

  // Register the port in the IsolateNameServer
  IsolateNameServer.registerPortWithName(receivePort.sendPort, 'myPortName');

  // Listen for messages
  receivePort.listen((message) {
    // Handle the message from the background isolate
    debugPrint('Received message from background isolate: $message');
    loadModel().then((value) {
      ImageScanner().getImages().then((images) {
        debugPrint(images.runtimeType.toString());
        for (var i = 0; i < images.length; i++) {
          // TO DO
          debugPrint("IMAGE ${images[i]}");
        }
      });
    });
    // Perform UI actions here (if necessary)
  });
}

Future loadModel() async {
  WidgetsFlutterBinding.ensureInitialized();
  Tflite.close();
  String res;
  res = (await Tflite.loadModel(
      model: "assets/model.tflite", labels: "assets/labels.txt"))!;
  debugPrint("Models loading status: $res");
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Handle the background message here
  // For example, log the message data
  debugPrint('Background message received: ${message.data.toString()}');

  final isBackground = message.data['run_background'];

  if (stringToBool(isBackground)) {
    final sendPort = IsolateNameServer.lookupPortByName('myPortName');

    // Send a message to the main isolate
    if (sendPort != null) {
      sendPort.send('Hello from the background isolate!');
    }
  }
}

void executeCodeOnNotification(RemoteMessage message) {
  // Your code here
  debugPrint('Notification received: ${message.notification?.body}');
  // Add the specific code you want to execute here
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    configureFirebaseMessaging();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home:
          const WidgetRingAnimator(ringIcons: ["Ring"], child: Text("Buttler")),
      initialRoute: "splash",
      routes: {
        "home": (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        "images": (context) => const Images(),
        "splash": (context) => const SplashEntry()
      },
      navigatorKey: navigatorKey,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
