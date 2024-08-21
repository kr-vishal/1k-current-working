// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:ui';
import 'package:goscore/allmatch.dart';
import 'package:goscore/editprofile.dart';
import 'package:goscore/news.dart';
import 'package:goscore/notificationlisthomeshow.dart';
import 'package:goscore/privacy.dart';
import 'package:goscore/stringfile.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:goscore/todaymatchalldetails.dart';
import 'package:badges/badges.dart' as badge_alias;
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'contactus.dart';
import 'help.dart';
import 'matchdetail.dart';
import 'newspageofbottombar.dart';
import 'notification.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
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

  late ColorNotifire notifire;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    darkmode = previusstate ?? false;
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  @override
  void initState() {
    getdarkmodepreviousstate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.backgroundallscreencolor,
      drawer: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        child: Drawer(
          width: MediaQuery.of(context).size.width / 1.3,
          backgroundColor: notifire.backgroundallscreencolor,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                        ),
                        Text(
                          Apptext.homeapp,
                          style: TextStyle(
                              color: notifire.textcolor,
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/ic_home.png',
                                scale: 4,
                                color: notifire.textcolor,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                Apptext.home,
                                style: TextStyle(
                                    color: notifire.textcolor,
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(const allmatch());
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/calendar.png',
                                scale: 2,
                                color: notifire.textcolor,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                Apptext.schedule,
                                style: TextStyle(
                                    color: notifire.textcolor,
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(const newspageofbottombar());
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/news.png',
                                scale: 2,
                                color: notifire.textcolor,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                Apptext.news,
                                style: TextStyle(
                                    color: notifire.textcolor,
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(const news());
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/video.png',
                                scale: 2,
                                color: notifire.textcolor,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                Apptext.video,
                                style: TextStyle(
                                    color: notifire.textcolor,
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Text(
                          Apptext.setting,
                          style: TextStyle(
                              color: notifire.greytextcolor,
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(const notification());
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/notification3.png',
                                scale: 2,
                                color: notifire.textcolor,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                Apptext.notification,
                                style: TextStyle(
                                    color: notifire.textcolor,
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(const todaymatchalldetails());
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/star.png',
                                scale: 2,
                                color: notifire.textcolor,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                Apptext.favourites,
                                style: TextStyle(
                                    color: notifire.textcolor,
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/moon.png',
                              scale: 2,
                              color: notifire.textcolor,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Row(
                              children: [
                                Text(
                                  Apptext.dark,
                                  style: TextStyle(
                                      color: notifire.textcolor,
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.24,
                                ),
                                Transform.scale(
                                  scale: 0.8,
                                  child: CupertinoSwitch(
                                    value: darkmode,
                                    activeColor: const Color(0xff0038D9),
                                    onChanged: (bool value) async {
                                      setState(() {
                                        darkmode = value;
                                      });
                                      final prefs =
                                          await SharedPreferences.getInstance();
                                      setState(
                                        () {
                                          notifire.setIsDark = value;
                                          prefs.setBool("setIsDark", value);
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Text(
                          Apptext.info,
                          style: TextStyle(
                              color: notifire.greytextcolor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(const help());
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/info.png',
                                scale: 2,
                                color: notifire.textcolor,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                Apptext.help,
                                style: TextStyle(
                                    color: notifire.textcolor,
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(const privacy());
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/shield.png',
                                scale: 2,
                                color: notifire.textcolor,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                Apptext.privacy,
                                style: TextStyle(
                                    color: notifire.textcolor,
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(const newspageofbottombar());
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/news2.png',
                                scale: 2,
                                color: notifire.textcolor,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                Apptext.publiser,
                                style: TextStyle(
                                    color: notifire.textcolor,
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(const contactus());
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/messages.png',
                                scale: 2,
                                color: notifire.textcolor,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                Apptext.contact,
                                style: TextStyle(
                                    color: notifire.textcolor,
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.052),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(const editprofile());
                              },
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    maxRadius:
                                        MediaQuery.of(context).size.height *
                                            0.03,
                                    backgroundImage:
                                        const AssetImage('assets/Avatar2.png'),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.02,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Apptext.drawername,
                                        style: TextStyle(
                                            color: notifire.textcolor,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        Apptext.overs,
                                        style: TextStyle(
                                            color: notifire.greytextcolor,
                                            fontSize: 10,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 83,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: notifire.textcolor,
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: notifire.backgroundallscreencolor,
        leadingWidth: MediaQuery.of(context).size.width * 0.2,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Image.asset(
              'assets/Menu.png',
              color: notifire.textcolor,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(
          Apptext.homeapp,
          style: TextStyle(
              color: notifire.textcolor,
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          InkWell(
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
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              'assets/Notification2.png',
              scale: 2,
              color: notifire.textcolor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.14,
              width: double.infinity,
              color: notifire.backgroundallscreencolor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/calendar.png',
                            scale: 2,
                            color: notifire.textcolor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            Apptext.date,
                            style: TextStyle(
                                color: notifire.textcolor,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 13,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemCount: day.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          //physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selected = index;
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 14,
                                    width: MediaQuery.of(context).size.width /
                                        8.48,
                                    decoration: BoxDecoration(
                                      color: selected == index
                                          ? const Color(0xff0038D9)
                                          : notifire.backgroundallscreencolor,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          day[index],
                                          style: TextStyle(
                                              color: selected == index
                                                  ? const Color(0xffF9F7F7)
                                                  : notifire.greytextcolor,
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          date[index],
                                          style: TextStyle(
                                              color: selected == index
                                                  ? const Color(0xffF9F7F7)
                                                  : notifire.textcolor,
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.01,
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                children: [
                  Text(
                    Apptext.live,
                    style: TextStyle(
                        color: notifire.textcolor,
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            InkWell(
              onTap: () {
                Get.to(const matchdetail());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Card(
                  elevation: 0,
                  borderOnForeground: true,
                  color: const Color(0xff0038D9),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    height: 178,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xff0038D9),
                      image: DecorationImage(
                        image: const AssetImage('assets/Patern.png'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.2), BlendMode.dstATop),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 12),
                        const Text(
                          'Stamford Bridge',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'week 10',
                          style: TextStyle(
                              color: notifire.greytextcolor,
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 28.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 32,
                                    backgroundColor: Colors.transparent,
                                    child: Image.asset(
                                      'assets/chelsea2.png',
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01),
                                  const Text(
                                    'Chelsea',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'Home',
                                    style: TextStyle(
                                        color: notifire.greytextcolor,
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Column(
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // crossAxisAlignment:
                                      //     CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '1',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Poppins',
                                              fontSize: 32,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          ':',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Poppins',
                                              fontSize: 32,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          '1',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Poppins',
                                              fontSize: 32,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                    Container(
                                      alignment: Alignment.center,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.028,
                                      width: MediaQuery.of(context).size.width *
                                          0.12,
                                      decoration: BoxDecoration(
                                          color: const Color(0xff34C759)
                                              .withOpacity(0.08),
                                          border: Border.all(
                                              color: const Color(0xff00C566)),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: const Text(
                                        '90+4',
                                        style: TextStyle(
                                            color: Color(0xff00C566),
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 32,
                                    backgroundColor: Colors.transparent,
                                    child: Image.asset(
                                      'assets/mancity2.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01),
                                  const Text(
                                    'Man. City',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'Away',
                                    style: TextStyle(
                                        color: notifire.greytextcolor,
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    const todaymatchalldetails(),
                  );
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/league1.png',
                      scale: 2.5,
                      color: notifire.textcolor,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Text(
                      Apptext.today,
                      style: TextStyle(
                          color: notifire.textcolor,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.40,
                    ),
                    Image.asset(
                      'assets/Vector.png',
                      scale: 2.5,
                      color: notifire.textcolor,
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.01,
            // ),
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
