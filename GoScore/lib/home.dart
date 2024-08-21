// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:developer';
import 'dart:ui';
import 'package:goscore/includes/api.dart';
import 'package:goscore/includes/app_bar.dart';
import 'package:goscore/includes/drawer.dart';
import 'package:goscore/includes/snippets/date_matches.dart';
import 'package:goscore/includes/snippets/live_match.dart';
import 'package:goscore/models/match.dart';
import 'package:goscore/stringfile.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

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

  bool darkmode = false;

  late ColorNotifire notifire;

  List<DateTime> dates = [];
  String selected_date = "";
  List<Match> live_matches = [];
  List<Match> date_matches = [];

  bool hasMatches = false;

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

  loadMatches(String selected_date) async {
    var matches = await ApiRequest().getDateMatches(selected_date);
    live_matches.clear();
    date_matches.clear();

    for (var i = 0; i < matches.length; i++) {
      Match match = Match.fromJson(matches[i]);

      if (match.isLive()) {
        live_matches.add(match);
      } else {
        date_matches.add(match);
      }
    }

    setState(() {
      hasMatches = true;
    });
  }

  @override
  void initState() {
    getdarkmodepreviousstate();
    super.initState();

    DateTime date = DateTime.now();

    for (var i = 0; i <= 10; i++) {
      dates.add(DateTime(date.year, date.month, date.day + i));
    }

    selected_date = DateFormat("yyyy-MM-dd").format(dates[0]);
    loadMatches(selected_date);
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.backgroundallscreencolor,
      drawer: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: const AppDrawer(),
      ),
      appBar: const MainAppBar(),
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
                            DateFormat.yMMMMd('en_US').format(dates[selected]),
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
                          itemCount: dates.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          //physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                String date =
                                    DateFormat('y-mM-dd').format(dates[index]);
                                log(date);
                                setState(() {
                                  selected = index;
                                  selected_date = date;
                                  loadMatches(selected_date);
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
                                          DateFormat('EE').format(dates[index]),
                                          style: TextStyle(
                                              color: selected == index
                                                  ? const Color(0xffF9F7F7)
                                                  : notifire.greytextcolor,
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          dates[index].day.toString(),
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
            live_matches.isNotEmpty
                ? LiveMatch(matches: live_matches)
                : const Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.0),
                    child: CircularProgressIndicator(),
                  ),

            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.01,
            // ),
            date_matches.isNotEmpty
                ? DateMatches(matches: date_matches)
                : const Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.0),
                    child: CircularProgressIndicator(),
                  ),
          ],
        ),
      ),
    );
  }
}
