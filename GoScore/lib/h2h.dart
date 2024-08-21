// ignore_for_file: camel_case_types

import 'package:goscore/stringfile.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class h2h extends StatefulWidget {
  const h2h({Key? key}) : super(key: key);

  @override
  State<h2h> createState() => _h2hState();
}

class _h2hState extends State<h2h> {
  final List mainlogo = [
    'assets/league1.png',
    'assets/league1.png',
  ];
  final List main = [
    Apptext.epl2122,
    Apptext.epl2122,
  ];
  final List brek = [
    Apptext.brecket1,
    Apptext.brecket1,
  ];
  final List team1 = [
    Apptext.chelsea,
    Apptext.chelsea,
  ];
  final List logo1 = [
    'assets/Badges.png',
    'assets/Badges.png',
  ];
  final List logo = [
    'assets/image.png',
    'assets/image.png',
  ];
  final List team2 = [
    Apptext.manutd,
    Apptext.manutd,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
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
                    Apptext.epl2122,
                    style: TextStyle(
                        color: notifire.textcolor,
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Text(
                    Apptext.brecket1,
                    style: TextStyle(
                        color: notifire.greytextcolor,
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              ListView.builder(
                  itemCount: mainlogo.length,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.080,
                          margin: const EdgeInsets.symmetric(vertical: 3),
                          child: Card(
                            color: notifire.checkboxlistilecolor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      team1[index],
                                      style: TextStyle(
                                          color: notifire.textcolor,
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02,
                                    ),
                                    Image.asset(
                                      logo1[index],
                                      scale: 2.5,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                                Text(
                                  '1:1',
                                  style: TextStyle(
                                      color: notifire.textcolor,
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      logo[index],
                                      scale: 2.5,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02,
                                    ),
                                    Text(
                                      team2[index],
                                      style: TextStyle(
                                          color: notifire.textcolor,
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                children: [
                  Image.asset('assets/league1.png',
                      scale: 2.5, color: notifire.textcolor),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Text(
                    Apptext.epl2022,
                    style: TextStyle(
                        color: notifire.textcolor,
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Text(
                    Apptext.brecket1,
                    style: TextStyle(
                        color: notifire.greytextcolor,
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              ListView.builder(
                  itemCount: mainlogo.length,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
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
                                      team1[index],
                                      style: TextStyle(
                                          color: notifire.textcolor,
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02,
                                    ),
                                    Image.asset(
                                      logo1[index],
                                      scale: 2.5,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                                Text(
                                  '0:0',
                                  style: TextStyle(
                                      color: notifire.textcolor,
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      logo[index],
                                      scale: 2.5,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02,
                                    ),
                                    Text(
                                      team2[index],
                                      style: TextStyle(
                                          color: notifire.textcolor,
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
