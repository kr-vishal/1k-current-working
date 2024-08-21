// ignore_for_file: camel_case_types

import 'package:goscore/theme/thememanager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class results extends StatefulWidget {
  const results({Key? key}) : super(key: key);

  @override
  State<results> createState() => _resultsState();
}

class _resultsState extends State<results> {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Card(
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  height: 165,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: notifire.checkboxlistilecolor,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: 24,
                        width: 72,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(48),
                            color: Colors.deepOrange),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'LIVE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'End 6th',
                        style: TextStyle(
                            color: notifire.greytextcolor,
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Chelsea',
                                  style: TextStyle(
                                      color: notifire.textcolor,
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                CircleAvatar(
                                  maxRadius:
                                      MediaQuery.of(context).size.height *
                                          0.018,
                                  backgroundImage:
                                      const AssetImage('assets/Badges5.png'),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                const Text(
                                  '7',
                                  style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontFamily: 'Poppins',
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              maxRadius:
                                  MediaQuery.of(context).size.height * 0.015,
                              backgroundImage:
                                  const AssetImage('assets/laliga2.png'),
                            ),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontFamily: 'Poppins',
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                CircleAvatar(
                                  maxRadius:
                                      MediaQuery.of(context).size.height *
                                          0.018,
                                  backgroundImage:
                                      const AssetImage('assets/Badges9.png'),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'Man city',
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
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Emirates Stadium,London',
                        style: TextStyle(
                            color: notifire.textcolor,
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Card(
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: notifire.checkboxlistilecolor,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 12),
                      Text(
                        'Match Stats',
                        style: TextStyle(
                            color: notifire.textcolor,
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Chelsea',
                                  style: TextStyle(
                                      color: notifire.textcolor,
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                CircleAvatar(
                                  maxRadius:
                                      MediaQuery.of(context).size.height *
                                          0.018,
                                  backgroundImage:
                                      const AssetImage('assets/Badges5.png'),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                const Text(
                                  '7',
                                  style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontFamily: 'Poppins',
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              maxRadius:
                                  MediaQuery.of(context).size.height * 0.015,
                              backgroundImage:
                                  const AssetImage('assets/laliga2.png'),
                            ),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontFamily: 'Poppins',
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                CircleAvatar(
                                  maxRadius:
                                      MediaQuery.of(context).size.height *
                                          0.018,
                                  backgroundImage:
                                      const AssetImage('assets/Badges9.png'),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'Man city',
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
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '6',
                              style: TextStyle(
                                  color: notifire.textcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Match Stats',
                              style: TextStyle(
                                  color: notifire.greytextcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '3',
                              style: TextStyle(
                                  color: notifire.textcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '56.9',
                              style: TextStyle(
                                  color: notifire.textcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Possesion %',
                              style: TextStyle(
                                  color: notifire.greytextcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '46.0',
                              style: TextStyle(
                                  color: notifire.textcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '766',
                              style: TextStyle(
                                  color: notifire.textcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Touches',
                              style: TextStyle(
                                  color: notifire.greytextcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '46',
                              style: TextStyle(
                                  color: notifire.textcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '565',
                              style: TextStyle(
                                  color: notifire.textcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Passes',
                              style: TextStyle(
                                  color: notifire.greytextcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '532',
                              style: TextStyle(
                                  color: notifire.textcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '5',
                              style: TextStyle(
                                  color: notifire.textcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Shots',
                              style: TextStyle(
                                  color: notifire.greytextcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '3',
                              style: TextStyle(
                                  color: notifire.textcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: notifire.checkboxlistilecolor,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 12),
                      Text(
                        'Match Stats',
                        style: TextStyle(
                            color: notifire.textcolor,
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Chelsea',
                                  style: TextStyle(
                                      color: notifire.textcolor,
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                CircleAvatar(
                                  maxRadius:
                                      MediaQuery.of(context).size.height *
                                          0.018,
                                  backgroundImage:
                                      const AssetImage('assets/Badges5.png'),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                const Text(
                                  '7',
                                  style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontFamily: 'Poppins',
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              maxRadius:
                                  MediaQuery.of(context).size.height * 0.015,
                              backgroundImage:
                                  const AssetImage('assets/laliga2.png'),
                            ),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontFamily: 'Poppins',
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                CircleAvatar(
                                  maxRadius:
                                      MediaQuery.of(context).size.height *
                                          0.018,
                                  backgroundImage:
                                      const AssetImage('assets/Badges9.png'),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'Man city',
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
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '6',
                              style: TextStyle(
                                  color: notifire.textcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Match Stats',
                              style: TextStyle(
                                  color: notifire.greytextcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '3',
                              style: TextStyle(
                                  color: notifire.textcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '56.9',
                              style: TextStyle(
                                  color: notifire.textcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Possesion %',
                              style: TextStyle(
                                  color: notifire.greytextcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '46.0',
                              style: TextStyle(
                                  color: notifire.textcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '766',
                              style: TextStyle(
                                  color: notifire.textcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Touches',
                              style: TextStyle(
                                  color: notifire.greytextcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '46',
                              style: TextStyle(
                                  color: notifire.textcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '565',
                              style: TextStyle(
                                  color: notifire.textcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Passes',
                              style: TextStyle(
                                  color: notifire.greytextcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '532',
                              style: TextStyle(
                                  color: notifire.textcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '5',
                              style: TextStyle(
                                  color: notifire.textcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Shots',
                              style: TextStyle(
                                  color: notifire.greytextcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '3',
                              style: TextStyle(
                                  color: notifire.textcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
