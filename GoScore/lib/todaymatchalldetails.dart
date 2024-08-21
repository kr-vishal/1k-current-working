// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:goscore/includes/snippets/match_list.dart';
import 'package:goscore/notificationlisthomeshow.dart';
import 'package:goscore/stringfile.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:badges/badges.dart' as badge_alias;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:goscore/models/match.dart';

class todaymatchalldetails extends StatefulWidget {
  final List<Match> matches;
  const todaymatchalldetails({Key? key, required this.matches})
      : super(key: key);

  @override
  State<todaymatchalldetails> createState() => _todaymatchalldetailsState();
}

class _todaymatchalldetailsState extends State<todaymatchalldetails> {
  late ColorNotifire notifire;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  int selected = 0;

  final List day = [
    Apptext.sun,
    Apptext.mon,
    Apptext.tod,
    Apptext.wet,
    Apptext.thu,
    Apptext.fri,
    Apptext.sat,
  ];
  final List date = [
    Apptext.date1,
    Apptext.date2,
    Apptext.date3,
    Apptext.date4,
    Apptext.date5,
    Apptext.date6,
    Apptext.date7,
  ];
  final List Team1 = [
    Apptext.forest,
    Apptext.manCity,
    Apptext.wolves,
    Apptext.forest,
    Apptext.manCity,
    Apptext.wolves,
    Apptext.forest,
    Apptext.manCity,
    Apptext.wolves,
    Apptext.forest,
  ];
  final List vector1 = [
    'assets/image27.png',
    'assets/Badges18.png',
    'assets/Badges19.png',
    'assets/image27.png',
    'assets/Badges18.png',
    'assets/Badges19.png',
    'assets/image27.png',
    'assets/Badges18.png',
    'assets/Badges19.png',
    'assets/Badges19.png',
  ];
  final List time = [
    Apptext.time1,
    Apptext.time2,
    Apptext.time3,
    Apptext.time1,
    Apptext.time2,
    Apptext.time3,
    Apptext.time1,
    Apptext.time2,
    Apptext.time3,
    Apptext.time3,
  ];
  final List vector2 = [
    'assets/Badges07.png',
    'assets/Badges20.png',
    'assets/Badges17.png',
    'assets/Badges07.png',
    'assets/Badges20.png',
    'assets/Badges17.png',
    'assets/Badges07.png',
    'assets/Badges20.png',
    'assets/Badges17.png',
    'assets/Badges07.png',
  ];
  final List Team2 = [
    Apptext.forest,
    Apptext.brighton,
    Apptext.leichester,
    Apptext.forest,
    Apptext.brighton,
    Apptext.leichester,
    Apptext.forest,
    Apptext.brighton,
    Apptext.leichester,
    Apptext.forest,
  ];
  bool darkmode = false;
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.backgroundallscreencolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: notifire.backgroundallscreencolor,
        leadingWidth: MediaQuery.of(context).size.width * 0.2,
        leading: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Image.asset('assets/Menu2.png',
                scale: 2, color: notifire.textcolor),
          ),
        ),
        centerTitle: true,
        title: Text(
          Apptext.todaymatchdetails,
          style: TextStyle(
              color: notifire.textcolor,
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                Get.to(const notifications());
              },
              child: badge_alias.Badge(
                shape: badge_alias.BadgeShape.square,
                toAnimate: false,
                animationType: badge_alias.BadgeAnimationType.scale,
                badgeColor: const Color(0xff0038D9),
                position: badge_alias.BadgePosition.topEnd(top: 14, end: 7.9),
                borderRadius: BorderRadius.circular(12),
                badgeContent: Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                ),
                child: Image.asset(
                  'assets/Notification.png',
                  color: notifire.textcolor,
                  scale: 2,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MatchList(matches: widget.matches),
          ],
        ),
      ),
    );
  }
}
