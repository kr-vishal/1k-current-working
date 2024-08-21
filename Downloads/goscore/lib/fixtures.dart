// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:goscore/matchdetail.dart';
import 'package:goscore/stringfile.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class fixtures extends StatefulWidget {
  const fixtures({Key? key}) : super(key: key);

  @override
  State<fixtures> createState() => _fixturesState();
}

class _fixturesState extends State<fixtures> {
  final List Team1 = [
    Apptext.forest,
    Apptext.manCity,
    Apptext.wolves,
  ];
  final List vector1 = [
    'assets/image27.png',
    'assets/Badges18.png',
    'assets/Badges19.png',
  ];
  final List time = [
    Apptext.time1,
    Apptext.time2,
    Apptext.time3,
  ];
  final List vector2 = [
    'assets/Badges07.png',
    'assets/Badges20.png',
    'assets/Badges17.png',
  ];
  final List Team2 = [
    Apptext.liverpool,
    Apptext.brighton,
    Apptext.leichester,
  ];
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

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
        backgroundColor: notifire.backgroundallscreencolor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/calendar.png',
                      scale: 2,
                      color: notifire.textcolor,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Text(
                      Apptext.datefix,
                      style: TextStyle(
                          color: notifire.textcolor,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: InkWell(
                  onTap: () {
                    Get.to(const matchdetail());
                  },
                  child: ListView.builder(
                      itemCount: Team1.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.080,
                          margin: const EdgeInsets.symmetric(vertical: 3),
                          child: Card(
                            elevation: 0,
                            color: notifire.checkboxlistilecolor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
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
                        );
                      }),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  children: [
                    Image.asset('assets/calendar.png',
                        scale: 2, color: notifire.textcolor),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Text(
                      Apptext.datefix2,
                      style: TextStyle(
                          color: notifire.textcolor,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: InkWell(
                  onTap: () {
                    Get.to(const matchdetail());
                  },
                  child: ListView.builder(
                      itemCount: Team1.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.080,
                          margin: const EdgeInsets.symmetric(vertical: 3),
                          child: Card(
                            elevation: 0,
                            color: notifire.checkboxlistilecolor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
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
                        );
                      }),
                ),
              ),
            ],
          ),
        ));
  }
}
