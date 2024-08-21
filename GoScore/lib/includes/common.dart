import 'dart:developer';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:goscore/includes/auth.dart';
import 'package:goscore/includes/navigation_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> hasSavedData(String dataKey, {bool isList = false}) async {
  dynamic data;

  Future<SharedPreferences> localPrefs = SharedPreferences.getInstance();

  final SharedPreferences prefs = await localPrefs;

  if (isList == true) {
    data = prefs.getStringList(dataKey);
  } else {
    data = prefs.getString(dataKey);
  }

  if (data == null) {
    return false;
  }

  return true;
}

Future<dynamic> getSaveData(String dataKey, {bool isList = false}) async {
  Future<SharedPreferences> localPrefs = SharedPreferences.getInstance();

  final SharedPreferences prefs = await localPrefs;

  return hasSavedData(dataKey, isList: isList).then((hasData) {
    if (hasData) {
      if (isList == true) {
        return prefs.getStringList(dataKey);
      } else {
        return prefs.getString(dataKey);
      }
    } else {
      return false;
    }
  });
}

Future<bool> saveData(String dataKey, dynamic data,
    {bool isList = false}) async {
  Future<SharedPreferences> localPrefs = SharedPreferences.getInstance();

  final SharedPreferences prefs = await localPrefs;

  if (isList == true) {
    prefs.setStringList(dataKey, data);
  } else {
    prefs.setString(dataKey, data);
  }

  return true;
}

String getBuildPlatform() {
  String platform = "web";

  try {
    if (Platform.isAndroid) {
      platform = 'android';
    } else if (Platform.isIOS) {
      platform = 'ios';
    }
  } catch (e) {
    log(e.toString());
  }

  return platform;
}

Future<SharedPreferences> getShared() async {
  Future<SharedPreferences> localPrefs = SharedPreferences.getInstance();
  return await localPrefs;
}

Future<bool> saveMapData(String dataKey, Map data) async {
  return await getShared().then((prefs) {
    String stringData = jsonEncode(data);

    return saveData(dataKey, stringData);
  });
}

void toastMsg(String message, {bool error = false, type = 'default'}) {
  Color? color = Colors.grey;

  if (error) {
    color = Colors.red[300];
  } else if (type == 'success') {
    color = Colors.green;
  } else if (type == 'plain') {
    color = Colors.grey[300];
  }

  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: color,
    textColor: (color == Colors.grey[300]) ? Colors.black : Colors.white,
    fontSize: 14.0,
  );
}

void toastError(message, {type}) {
  toastMsg(message, error: true, type: type);
}

void toastPlain(message) {
  toastMsg(message, type: "plain");
}

Future showLoader(BuildContext context,
    {String loaderTitle = "Loading, please wait !"}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: const Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(
                  value: null,
                  strokeWidth: 5.0,
                )
              ],
            ),
          ),
          title: Text(loaderTitle),
          elevation: 5.0,
        );
      });
}

getGlobalContext() {
  return NavigationService.navigatorKey.currentContext;
}

void userlogout({bool sessionExpired = false, bool logout = false}) {
  GlobalKey<NavigatorState> navigatorKey = NavigationService.navigatorKey;

  if (navigatorKey.currentState?.canPop() != null) {
    navigatorKey.currentState?.popUntil((route) => route.isFirst);
  }

  Auth auth = Auth();
  auth.logout().then((value) {
    if (sessionExpired) {
      toastMsg("Session Expired, please login again !!", error: true);
    }

    if (logout) {
      toastMsg("Logged out successfully !!", type: "success");
    }
    navigatorKey.currentState?.pushReplacementNamed("/login");
  });
}

void checkUserLogin() async {
  if (!await Auth().isLoggedIn()) {
    userlogout();
  }
}

Future<bool> saveUserToken(token) {
  return saveData('access_token', token);
}

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
      (Map<K, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}
