// ignore_for_file: camel_case_types

import 'package:goscore/stringfile.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeline_tile/timeline_tile.dart';

class summary extends StatefulWidget {
  const summary({Key? key}) : super(key: key);

  @override
  State<summary> createState() => _summaryState();
}

class _summaryState extends State<summary> {
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
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.02,
              // ),
              TimelineTile(
                indicatorStyle: IndicatorStyle(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.2,
                  indicatorXY: 0.0,
                  indicator: Image.asset(
                    'assets/Number2.png',
                    fit: BoxFit.cover,
                  ),
                ),
                isFirst: true,
                afterLineStyle: LineStyle(
                  thickness: 1,
                  color: notifire.bordercolor,
                ),
                beforeLineStyle:
                    LineStyle(thickness: 1, color: notifire.bordercolor),
                alignment: TimelineAlign.center,
                endChild: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        const Text(
                          Apptext.line1,
                          style: TextStyle(
                              color: Color(0xff00C566),
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              height: 1.5,
                              fontFamily: 'poppins'),
                        ),
                        Text(
                          Apptext.Lisandro,
                          style: TextStyle(
                              color: notifire.textcolor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              height: 1.5,
                              fontFamily: 'poppins'),
                        ),
                        Text(
                          Apptext.yellow,
                          style: TextStyle(
                              color: notifire.greytextcolor,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              height: 1.5,
                              fontFamily: 'poppins'),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              TimelineTile(
                indicatorStyle: IndicatorStyle(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.2,
                  indicatorXY: 0.0,
                  indicator: Image.asset(
                    'assets/Number3.png',
                    fit: BoxFit.cover,
                  ),
                ),
                afterLineStyle: LineStyle(
                  thickness: 1,
                  color: notifire.bordercolor,
                ),
                beforeLineStyle: LineStyle(
                  thickness: 1,
                  color: notifire.bordercolor,
                ),
                alignment: TimelineAlign.center,
                endChild: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        const Text(
                          Apptext.line2,
                          style: TextStyle(
                              color: Color(0xff00C566),
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              height: 1.5,
                              fontFamily: 'poppins'),
                        ),
                        Text(
                          Apptext.Casemiro,
                          style: TextStyle(
                              color: notifire.textcolor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              height: 1.5,
                              fontFamily: 'poppins'),
                        ),
                        Text(
                          Apptext.Goal,
                          style: TextStyle(
                              color: notifire.greytextcolor,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              height: 1.5,
                              fontFamily: 'poppins'),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              TimelineTile(
                indicatorStyle: IndicatorStyle(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.2,
                  indicatorXY: 0.0,
                  indicator: Image.asset(
                    'assets/Number3.png',
                    fit: BoxFit.cover,
                  ),
                ),
                afterLineStyle: LineStyle(
                  thickness: 1,
                  color: notifire.bordercolor,
                ),
                beforeLineStyle: LineStyle(
                  thickness: 1,
                  color: notifire.bordercolor,
                ),
                alignment: TimelineAlign.center,
                startChild: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        const Text(
                          Apptext.line3,
                          style: TextStyle(
                              color: Color(0xff00C566),
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              height: 1.5,
                              fontFamily: 'poppins'),
                        ),
                        Text(
                          Apptext.Jorginho,
                          style: TextStyle(
                              color: notifire.textcolor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              height: 1.5,
                              fontFamily: 'poppins'),
                        ),
                        Text(
                          Apptext.yellow,
                          style: TextStyle(
                              color: notifire.greytextcolor,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              height: 1.5,
                              fontFamily: 'poppins'),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              TimelineTile(
                indicatorStyle: IndicatorStyle(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.2,
                  indicatorXY: 0.0,
                  indicator: Image.asset(
                    'assets/Number2.png',
                    fit: BoxFit.cover,
                  ),
                ),
                afterLineStyle: LineStyle(
                  thickness: 1,
                  color: notifire.bordercolor,
                ),
                beforeLineStyle: LineStyle(
                  thickness: 1,
                  color: notifire.bordercolor,
                ),
                alignment: TimelineAlign.center,
                endChild: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        const Text(
                          Apptext.line4,
                          style: TextStyle(
                              color: Color(0xff00C566),
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              height: 1.5,
                              fontFamily: 'poppins'),
                        ),
                        Text(
                          Apptext.Shaw,
                          style: TextStyle(
                              color: notifire.textcolor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              height: 1.5,
                              fontFamily: 'poppins'),
                        ),
                        Text(
                          Apptext.yellow,
                          style: TextStyle(
                              color: notifire.greytextcolor,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              height: 1.5,
                              fontFamily: 'poppins'),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              TimelineTile(
                indicatorStyle: IndicatorStyle(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.2,
                  indicatorXY: 0.0,
                  indicator: Image.asset(
                    'assets/Number3.png',
                    fit: BoxFit.cover,
                  ),
                ),
                afterLineStyle:
                    LineStyle(thickness: 1, color: notifire.bordercolor),
                beforeLineStyle:
                    LineStyle(thickness: 1, color: notifire.bordercolor),
                alignment: TimelineAlign.center,
                startChild: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        const Text(
                          Apptext.line5,
                          style: TextStyle(
                              color: Color(0xff00C566),
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              height: 1.5,
                              fontFamily: 'poppins'),
                        ),
                        Text(
                          Apptext.Jorginho,
                          style: TextStyle(
                              color: notifire.textcolor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              height: 1.5,
                              fontFamily: 'poppins'),
                        ),
                        Text(
                          Apptext.yellow,
                          style: TextStyle(
                              color: notifire.greytextcolor,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              height: 1.5,
                              fontFamily: 'poppins'),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              TimelineTile(
                indicatorStyle: IndicatorStyle(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.2,
                  indicatorXY: 0.0,
                  indicator: Image.asset(
                    'assets/Number2.png',
                    fit: BoxFit.cover,
                  ),
                ),
                isLast: true,
                afterLineStyle:
                    LineStyle(thickness: 1, color: notifire.bordercolor),
                beforeLineStyle:
                    LineStyle(thickness: 1, color: notifire.bordercolor),
                alignment: TimelineAlign.center,
                endChild: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        const Text(
                          Apptext.line6,
                          style: TextStyle(
                              color: Color(0xff00C566),
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              height: 1.5,
                              fontFamily: 'poppins'),
                        ),
                        Text(
                          Apptext.Freed,
                          style: TextStyle(
                              color: notifire.textcolor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              height: 1.5,
                              fontFamily: 'poppins'),
                        ),
                        Text(
                          Apptext.yellow,
                          style: TextStyle(
                              color: notifire.greytextcolor,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              height: 1.5,
                              fontFamily: 'poppins'),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
