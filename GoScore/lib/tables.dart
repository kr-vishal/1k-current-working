// ignore_for_file: camel_case_types

import 'package:goscore/theme/thememanager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class tables extends StatefulWidget {
  const tables({Key? key}) : super(key: key);

  @override
  State<tables> createState() => _tablesState();
}

class _tablesState extends State<tables> {
  final List pos = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
  ];
  final List teamlogo = [
    'assets/Badges1.png',
    'assets/Badges9.png',
    'assets/image11.png',
    'assets/image7.png',
    'assets/Badges.png',
    'assets/image.png',
    'assets/image10.png',
    'assets/Badges172.png',
    'assets/Badges20.png',
  ];
  final List teamname = [
    'Arsenal',
    'Man City',
    'Spurs',
    'Newcastle',
    'Chelsea',
    'Man Utd',
    'Fulham',
    'Liverpool',
    'Brighton',
  ];
  final List total = [
    '11',
    '11',
    '12',
    '12',
    '11',
    '11',
    '12',
    '11',
    '11',
  ];
  final List win = [
    '9',
    '8',
    '7',
    '6',
    '5',
    '6',
    '5',
    '4',
    '4',
  ];
  final List pts = [
    '28',
    '26',
    '23',
    '21',
    '21',
    '20',
    '18',
    '16',
    '15',
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
              Container(
                height: MediaQuery.of(context).size.height * 0.053,
                decoration: BoxDecoration(
                    color: notifire.checkboxlistilecolor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 30,
                      child: SizedBox(
                        // color: Colors.red,
                        width: MediaQuery.of(context).size.width * 0.12,
                        child: Center(
                          child: Text(
                            'Pos',
                            style: TextStyle(
                                color: notifire.textcolor,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 70,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        // color: Colors.green,
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Text(
                              'Team',
                              style: TextStyle(
                                  color: notifire.textcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 20,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.12,
                        // color: Colors.red,
                        child: Center(
                          child: Text(
                            'P',
                            style: TextStyle(
                                color: notifire.textcolor,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 20,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.12,
                        // color: Colors.green,
                        child: Center(
                          child: Text(
                            'w',
                            style: TextStyle(
                                color: notifire.textcolor,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 20,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.12,
                        // color: Colors.red,
                        child: Center(
                          child: Text(
                            'Pts',
                            style: TextStyle(
                                color: notifire.textcolor,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: pos.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.053,
                      decoration: BoxDecoration(
                        color: notifire.backgroundallscreencolor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 50,
                            child: SizedBox(
                              // color: Colors.red,
                              width: MediaQuery.of(context).size.width * 0.12,
                              child: Center(
                                child: Text(
                                  pos[index],
                                  style: TextStyle(
                                      color: notifire.textcolor,
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                              flex: 15,
                              child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height: MediaQuery.of(context).size.height *
                                      0.035,
                                  child: Image.asset(
                                    teamlogo[index],
                                    fit: BoxFit.fill,
                                  ))),
                          Flexible(
                            flex: 50,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text(
                                teamname[index],
                                style: TextStyle(
                                    color: notifire.textcolor,
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 20,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.12,
                              // color: Colors.red,
                              child: Center(
                                child: Text(
                                  total[index],
                                  style: TextStyle(
                                      color: notifire.textcolor,
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 20,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.12,
                              // color: Colors.green,
                              child: Center(
                                child: Text(
                                  win[index],
                                  style: TextStyle(
                                      color: notifire.textcolor,
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 20,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.12,
                              // color: Colors.red,
                              child: Center(
                                child: Text(
                                  pts[index],
                                  style: TextStyle(
                                      color: notifire.textcolor,
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
