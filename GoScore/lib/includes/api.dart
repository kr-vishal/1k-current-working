import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:device_imei/device_imei.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:goscore/includes/navigation_service.dart';
import 'package:goscore/models/user.dart';
import './api_urls.dart';
import './common.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
//import 'package:imei_plugin/imei_plugin.dart';
//import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';

class NetworkUtil {
  // next three lines makes this class a Singleton
  static final NetworkUtil _instance = NetworkUtil.internal();

  NetworkUtil.internal();

  factory NetworkUtil() => _instance;

  final JsonDecoder _decoder = const JsonDecoder();

  Future<dynamic> get(String url, {token = false}) async {
    //showLoader(getGlobalContext());

    Map<String, String> requestHeaders = {
      "Content-type": "application/json",
      "Accept": "application/json"
    };

    if (token == null || token == false) {
      requestHeaders['Authorization'] = authToken;
    } else {
      var token =
          await getSaveData('logged_in_user_data').then((value) => value);

      requestHeaders['Authorization'] = "Bearer $token";
    }
    /* if (Navigator.of(getGlobalContext()).canPop()) {

      Navigator.of(getGlobalContext()).pop();
    } */

    return http
        .get(Uri.parse(url), headers: requestHeaders)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || res.isEmpty) {
        throw Exception("Error while fetching data $url");
      }
      return _decoder.convert(res);
    });
  }

  Future<Map> post(String url,
      {Map<String, String>? headers, body, encoding, token = false}) async {
    Map<String, String> requestHeaders = {
      "Content-type": "application/json",
      "Accept": "application/json"
    };

    showLoader(getGlobalContext());

    if (token == null || token == false) {
      requestHeaders['Authorization'] = authToken;
    } else {
      var token = await getSaveData('auth_token').then((value) => value);

      requestHeaders['Authorization'] = "Bearer $token";
    }

    body['source'] = getAppSource();

    if (body.length > 0) {
      body = jsonEncode(body);
    }
    if (body.length == 0) {
      body = '[]';
    }

    if (headers != null) {
      requestHeaders.addAll(headers);
    }

    Navigator.of(getGlobalContext()).pop();

    return http
        .post(Uri.parse(url),
            body: body, headers: requestHeaders, encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      log(res);
      log(body);
      log(requestHeaders.toString());
      log(url.toString());
      log(statusCode.toString());
      if (statusCode == 401) {
        //userlogout();
      } else if (statusCode == 498) {
        return {"status": false, "error_code": 498};
      } else if (statusCode < 200 || statusCode > 400 || res.isEmpty) {
        final json = _decoder.convert(res);

        return {
          "status": false,
          "message": (json['message'] ?? "Error while fetching data")
        };
      }

      return _decoder.convert(res);
    });
  }
}

class ApiRequest {
  String base = baseUrl;
  final _netUtil = NetworkUtil();

  Future<dynamic> apiData(String url,
      {required String type,
      body,
      Map<String, String>? headers,
      bool token = false}) {
    if (type == 'get') {
      return _netUtil.get("$baseUrl$url", token: token).then((value) {
        return value;
      }).catchError((onError) {
        log(onError.toString());
      });
    } else {
      return _netUtil
          .post("$baseUrl$url", body: body, headers: headers, token: token)
          .then((value) async {
        if (value.containsKey('error_code') && value['error_code'] == 498) {
          await refreshToken();
          return await _netUtil
              .post("$baseUrl$url", body: body, headers: headers, token: token)
              .then((value) => value);
        } else if (value.containsKey("status") && value['status'] == false) {
          toastError(value['message']);
        }

        return value;
      });
    }
  }

  Future<List<dynamic>> getDateMatches(String date) async {
    final Map thumbs = {
      "thumbnails[0]": "away_team.logo.icon",
      "thumbnails[1]": "home_team.logo.icon",
      "key": "match_date",
      "filter": "contains",
      "s": date
    };
    log("Selected date : $date");
    final String queryString = Uri(
        queryParameters:
            thumbs.map((key, value) => MapEntry(key, value?.toString()))).query;

    return await apiData("v1/resources/matches?$queryString",
            type: "get", token: true)
        .then((value) {
      return value['data'];
    });
  }

  Future<List<dynamic>> getPremierLeagurFixture() async {
    final Map thumbs = {
      "thumbnails[0]": "away_team.logo.icon",
      "thumbnails[1]": "home_team.logo.icon",
      "key": "match_status",
      "filter": "equals",
      "s": "completed",
      "sort_order": "asc",
      "order_by": "match_date"
    };

    final String queryString = Uri(
        queryParameters:
            thumbs.map((key, value) => MapEntry(key, value?.toString()))).query;

    return await apiData("v1/resources/matches?$queryString",
            type: "get", token: true)
        .then((value) {
      return value['data'];
    });
  }

  Future<User> getProfile() async {
    return await apiData("profile", type: "get", token: true).then((value) {
      print(value['data']);
      return User.fromJson(value['data']);
    });
  }

  Future<dynamic> refreshToken() async {
    var token = await getSaveData('auth_token').then((value) => value);

    Map body = {"token": token};

    Future<dynamic> response =
        apiData(refreshTokenEnd, type: 'get', body: body, token: true);

    return response.then((value) {
      if (value != null &&
          value.containsKey('response') &&
          value['response']['token'] != null) {
        saveData('auth_token', value['response']['token']);
      }
    });
  }

  Future<dynamic> register(
      {required String? name, required String email, bool? socialLogin}) async {
    return apiData('register',
        type: 'post',
        body: {"name": name, "email": email, "social_login": socialLogin});
  }

  Future<dynamic> checkHardUpdate() {
    log("checkHardUpdate History Started");

    return apiData(checkUpdate, type: 'post', body: {
      'data': {'app': 'hda', 'source': 'football_app'}
    });
  }

  Future<dynamic> sendLoginOtpByNumber(String mobile, {dynamic resendOtp = 0}) {
    log("sendLoginOtpByNumber");

    Future<dynamic> response = apiData(generateOtp, type: 'post', body: {
      "mobile_number": mobile,
      "resend_otp": resendOtp,
      "source": "consumer_app"
    });
    return response.then((data) {
      return data;
    });
  }

  Future<Map> sendLoginOtpByCall(String mobile) {
    log("sendLoginOtpByNumber");

    Future<dynamic> response = apiData(otpByCall,
        type: 'post',
        body: {"mobile_number": mobile, "source": "consumer_app"});
    return response.then((data) {
      return data;
    });
  }

  Future<dynamic> verifyLoginOtpByNumber(String mobile, String otp,
      {bool waOptin = false}) async {
    Map<dynamic, dynamic> location;
    String cleverTapToken = "web_na";
    String version;
    String buildNumber;
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    if (getBuildPlatform() != "web") {
      deviceData = await initPlatformState();

      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
      //location = await getLocation();
      location = {
        "lat": 0,
        "long": 0,
      };
    } else {
      //WebInfo packageInfo = WebInfo();
      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
      location = {
        "lat": 0,
        "long": 0,
      };
    }

    Map body = {
      "mobile_no": mobile,
      "otp_code": otp,
      "resend_otp": 0,
      "device_model":
          getBuildPlatform() == "web" ? "web" : deviceData?["model"],
      "device_imei": getBuildPlatform() == "web" ? "web" : imei,
      "latitude": location['lat'],
      "longitude": location['long'],
      "os_version_code": getBuildPlatform() == "web"
          ? "web"
          : Platform.isAndroid
              ? deviceData!["version.release"]
              : deviceData!["utsname.release"],
      "app_version": getBuildPlatform() == "web" ? "web" : version,
      "app_version_code": getBuildPlatform() == "web" ? "web" : buildNumber,
      "source": getAppSource(),
      "wa_optin": waOptin,
      "clevertap_token": cleverTapToken
    };

    return apiData(verifyOtpEnd, type: 'post', body: body);
  }
}

Future<List> getProductSuggestion(String keyword) {
  String suggestionUrl = apiBaseUrl + apiProductSuggestion + keyword;

  return http.get(suggestionUrl as Uri).then((http.Response response) {
    if (response.statusCode == 200) {
      Map res = jsonDecode(response.body);

      return res['data'];
    }

    return [];
  });
}

Map<String, dynamic>? deviceData;
String? imei, deviceid, meid;

Future<dynamic> initPlatformState() async {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  deviceid = (Platform.isAndroid)
      ? (await DeviceImei().getDeviceInfo())!.deviceId
      : "NA_IOS";

  try {
    imei = await DeviceImei().getDeviceImei();
    meid = (Platform.isAndroid)
        ? (await DeviceImei().getDeviceInfo())!.deviceId
        : "NA_IOS";
    log('Your deviceid: $deviceid\nYour IMEI: $imei\nYour MEID: $meid');
  } on PlatformException catch (e) {
    imei = "permission_denied :: ${e.message}";
  }

  try {
    if (Platform.isAndroid) {
      deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
    } else if (Platform.isIOS) {
      deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
    }
  } on PlatformException {
    deviceData = <String, dynamic>{'Error:': 'Failed to get platform version.'};
  }

  return deviceData;
}

Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
  return <String, dynamic>{
    'version.securityPatch': build.version.securityPatch,
    'version.sdkInt': build.version.sdkInt,
    'version.release': build.version.release,
    'version.previewSdkInt': build.version.previewSdkInt,
    'version.incremental': build.version.incremental,
    'version.codename': build.version.codename,
    'version.baseOS': build.version.baseOS,
    'board': build.board,
    'bootloader': build.bootloader,
    'brand': build.brand,
    'device': build.device,
    'display': build.display,
    'fingerprint': build.fingerprint,
    'hardware': build.hardware,
    'host': build.host,
    'id': build.id,
    'manufacturer': build.manufacturer,
    'model': build.model,
    'product': build.product,
    'supported32BitAbis': build.supported32BitAbis,
    'supported64BitAbis': build.supported64BitAbis,
    'supportedAbis': build.supportedAbis,
    'tags': build.tags,
    'type': build.type,
    'isPhysicalDevice': build.isPhysicalDevice,
    'androidId': build.id,
    'systemFeatures': build.systemFeatures,
  };
}

Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
  return <String, dynamic>{
    'name': data.name,
    'systemName': data.systemName,
    'systemVersion': data.systemVersion,
    'model': data.model,
    'localizedModel': data.localizedModel,
    'identifierForVendor': data.identifierForVendor,
    'isPhysicalDevice': data.isPhysicalDevice,
    'utsname.sysname': data.utsname.sysname,
    'utsname.nodename': data.utsname.nodename,
    'utsname.release': data.utsname.release,
    'utsname.version': data.utsname.version,
    'utsname.machine': data.utsname.machine,
  };
}

Future<Map> getDoctorProfile() async {
  /* return getMapData("doctor_profile").then((value) {
    if (value == false || value == null) {
      return apiInstance()
          .apiData(profileUrl, body: {}, type: 'post', token: true)
          .then((value) {
        saveMapData('doctor_profile', value['response']);
        return value['response'];
      });
    }
    return value;
  }); */

  return apiInstance()
      .apiData(profileUrl, body: {}, type: 'post', token: true)
      .then((value) {
    saveMapData('doctor_profile', value['response']);
    return value['response'];
  });
}

ApiRequest apiInstance() {
  return ApiRequest();
}

String getAppSource() {
  String source;
  String platform = getBuildPlatform();

  if (platform == "ios") {
    source = "partner_app_ios";
  } else if (platform == "android") {
    source = "partner_app";
  } else {
    source = "partner_app_web";
  }

  return source;
}
