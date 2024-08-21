// ignore_for_file: camel_case_types

import 'package:goscore/stringfile.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class lineups extends StatefulWidget {
  const lineups({Key? key}) : super(key: key);

  @override
  State<lineups> createState() => _lineupsState();
}

class _lineupsState extends State<lineups> {
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/Badges.png',
                          scale: 1.8,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Apptext.chelsea,
                              style: TextStyle(
                                  color: notifire.textcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              Apptext.chelseadown,
                              style: TextStyle(
                                  color: notifire.greytextcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              Apptext.man,
                              style: TextStyle(
                                  color: notifire.textcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              Apptext.mandown,
                              style: TextStyle(
                                  color: notifire.greytextcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                        Image.asset(
                          'assets/image.png',
                          scale: 1.8,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color(0xffF7F7F7),
                      image: DecorationImage(
                          image: AssetImage('assets/Lineups.png'),
                          fit: BoxFit.fill)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: [
                    Text(
                      Apptext.manager,
                      style: TextStyle(
                          color: notifire.greytextcolor,
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          Apptext.graham,
                          style: TextStyle(
                              color: notifire.textcolor,
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          Apptext.potter,
                          style: TextStyle(
                              color: notifire.textcolor,
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          Apptext.E,
                          style: TextStyle(
                              color: notifire.textcolor,
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          Apptext.tenhag,
                          style: TextStyle(
                              color: notifire.textcolor,
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: [
                    Text(
                      Apptext.lineups,
                      style: TextStyle(
                          color: notifire.greytextcolor,
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Apptext.kepa,
                          style: TextStyle(
                              color: notifire.textcolor,
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          Apptext.arrizabalaga,
                          style: TextStyle(
                              color: notifire.textcolor,
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Apptext.david,
                          style: TextStyle(
                              color: notifire.textcolor,
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          Apptext.degea,
                          style: TextStyle(
                              color: notifire.textcolor,
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Apptext.cesar,
                          style: TextStyle(
                              color: notifire.textcolor,
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          Apptext.azpilicueta,
                          style: TextStyle(
                              color: notifire.textcolor,
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Apptext.diogo,
                          style: TextStyle(
                              color: notifire.textcolor,
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          Apptext.dalot,
                          style: TextStyle(
                              color: notifire.textcolor,
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
