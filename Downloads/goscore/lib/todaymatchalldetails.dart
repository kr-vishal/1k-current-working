// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:goscore/notificationlisthomeshow.dart';
import 'package:goscore/stringfile.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:badges/badges.dart' as badge_alias;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'matchdetail.dart';
import 'news.dart';

class todaymatchalldetails extends StatefulWidget {
  const todaymatchalldetails({Key? key}) : super(key: key);

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: InkWell(
                onTap: () {
                  Get.to(const matchdetail());
                },
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemExtent: 108,
                  dragStartBehavior: DragStartBehavior.down,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Stack(
                      alignment: Alignment.center,

                      ///watch now align
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.080,
                          margin: const EdgeInsets.symmetric(vertical: 3),
                          child: Card(
                            color: notifire.checkboxlistilecolor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      Team1[index],
                                      style: TextStyle(
                                          color: notifire.textcolor,
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02,
                                    ),
                                    Image.asset(
                                      vector1[index],
                                      scale: 2.5,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: MediaQuery.of(context).size.height *
                                      0.025,
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff34C759)
                                          .withOpacity(0.08),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Text(
                                    time[index],
                                    style: const TextStyle(
                                        color: Color(0xff00C566),
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      vector2[index],
                                      scale: 2.5,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02,
                                    ),
                                    Text(
                                      Team2[index],
                                      style: TextStyle(
                                          color: notifire.textcolor,
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          //top: 60,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: InkWell(
                              onTap: () {
                                Get.to(const news());
                              },
                              child: Container(
                                height: 44,
                                width: 136,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(48),
                                  color: notifire.checkboxlistilecolor,
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 16),
                                    Text(
                                      'Watch Now',
                                      style: TextStyle(
                                          color: notifire.greytextcolor,
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(width: 12),
                                    CircleAvatar(
                                      maxRadius:
                                          MediaQuery.of(context).size.height *
                                              0.022,
                                      backgroundImage: const AssetImage(
                                          'assets/watchnow.png'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
