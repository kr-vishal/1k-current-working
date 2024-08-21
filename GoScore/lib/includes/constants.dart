library globals;

import 'package:flutter/material.dart';

int primarySwatchColor = 0xFF008c93;
String docsAppVersion = "1.5.0";

Map<int, Color> swatchColors = {
  50: const Color.fromRGBO(0, 140, 147, .1),
  100: const Color.fromRGBO(0, 140, 147, .2),
  200: const Color.fromRGBO(0, 140, 147, .3),
  300: const Color.fromRGBO(0, 140, 147, .4),
  400: const Color.fromRGBO(0, 140, 147, .5),
  500: const Color.fromRGBO(0, 140, 147, .6),
  600: const Color.fromRGBO(0, 140, 147, .7),
  700: const Color.fromRGBO(0, 140, 147, .8),
  800: const Color.fromRGBO(0, 140, 147, .9),
  900: const Color.fromRGBO(0, 140, 147, 1),
};

Color appBarBackgroundColor = Colors.white;

String homeTitle = "Healthians Doctor Consultation";
String homeAppBarTitle = "Flutter Demo App Bar";
String menuDropdownValue = "Select One";
List<String> dropdownValues = ['Select One', 'Two', 'Three', 'Four'];

String loginText = "Login";
String loginHelpText =
    "Enter your mobile number, we will send you OTP to verify your deails";

List dashboardActions = [
  [
    {
      "title": "My Profile",
      "navigateTo": "/profile",
      "module": "my_profile",
      "icon": const Image(
          image: AssetImage("images/icons/profile.png"),
          width: 46.0,
          height: 46.0)
    },
    {
      "title": "Upcoming Consultations",
      "navigateTo": "/upcomingConsults",
      "module": "upcoming_consultation",
      "icon": const Image(
          image: AssetImage("images/icons/upcoming.png"),
          width: 46.0,
          height: 46.0)
    }
  ],
  [
    {
      "title": "Consultation History",
      "navigateTo": "/consultHistory",
      "module": "consultation_history",
      "icon": const Image(
          image: AssetImage("images/icons/history.png"),
          width: 46.0,
          height: 46.0)
    },
    /* {
      "title": "Doctor Availibility",
      //"navigateTo" : "/docAvailibility",
      "navigateTo": "/prescription",
      "icon": Image(
          image: AssetImage("images/icons/avail.png"),
          width: 46.0,
          height: 46.0)
    } */
  ]
];

String labTestsKey = "prescription_labtests_";
String diagnosisKey = "prescription_diagnosis_";
String followupKey = "prescription_followup_";
String medicineKey = "prescription_medicine_";

TextStyle buttonStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontFamily: "Roboto",
    fontSize: 10.0);

String cancellationError =
    "Consultation can be cancelled 15 minutes before start time.";