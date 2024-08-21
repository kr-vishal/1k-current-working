import 'package:meme_buttler/services/global.dart';

Future<dynamic> goTo(routeName) {
  return navigatorKey.currentState!.pushNamed(routeName);
}

Future<dynamic> goToReplace(routeName) {
  return navigatorKey.currentState!.pushReplacementNamed(routeName);
}

Future<dynamic> goToReplaceWithAnimation(routeName) {
  return navigatorKey.currentState!.pushReplacementNamed(routeName);
}
