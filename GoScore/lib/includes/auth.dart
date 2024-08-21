import 'package:goscore/includes/common.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final String preferrenceKey = "logged_in_user_data";

  Future<bool> isLoggedIn() async {
    dynamic data;

    data = await getSaveData(preferrenceKey);

    if (data == null || data == false) {
      return false;
    }

    return true;
  }

  Future<dynamic> login({required String data}) async {
    saveData(preferrenceKey, data);

    return data;
  }

  Future<bool> logout() async {
    final SharedPreferences prefs = await _prefs;

    prefs.clear();

    return true;
  }
}
