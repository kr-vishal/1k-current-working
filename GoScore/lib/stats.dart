// ignore_for_file: camel_case_types

import 'package:goscore/stringfile.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class stats extends StatefulWidget {
  const stats({Key? key}) : super(key: key);

  @override
  State<stats> createState() => _statsState();
}

class _statsState extends State<stats> {
  final List number1 = [
    Apptext.two,
    Apptext.four,
    Apptext.twosix,
    Apptext.tree3,
    Apptext.zero,
    Apptext.ten,
    Apptext.three,
    Apptext.tenn,
    Apptext.tenn2,
  ];
  final List name = [
    Apptext.shot,
    Apptext.shots,
    Apptext.possession,
    Apptext.yellowcard,
    Apptext.corner,
    Apptext.crosses,
    Apptext.saves,
    Apptext.goalk,
    Apptext.treatments,
  ];
  final List number2 = [
    Apptext.six6,
    Apptext.onefive,
    Apptext.sevanfour,
    Apptext.two2,
    Apptext.two22,
    Apptext.twotree,
    Apptext.two222,
    Apptext.two2222,
    Apptext.two22222,
  ];
  final List color = [
    const Color(0xff37003C),
    const Color(0xff37003C),
    const Color(0xff37003C),
    const Color(0xff0038D9),
    Colors.transparent,
    const Color(0xff37003C),
    const Color(0xff0038D9),
    const Color(0xff0038D9),
    const Color(0xff0038D9),
  ];
  final List color2 = [
    const Color(0xff0038D9),
    const Color(0xff0038D9),
    const Color(0xff0038D9),
    const Color(0xff37003C),
    const Color(0xff0038D9),
    const Color(0xff0038D9),
    const Color(0xff37003C),
    const Color(0xff37003C),
    const Color(0xff37003C),
  ];
  final List indicator1 = [
    0.3,
    0.4,
    0.2,
    0.5,
    0.0,
    0.5,
    0.5,
    0.7,
    0.8,
  ];
  final List indicator2 = [
    0.7,
    0.6,
    0.8,
    0.5,
    1.0,
    0.6,
    0.5,
    0.3,
    0.2,
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
        body: ListView.builder(
            itemCount: number1.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          number1[index],
                          style: TextStyle(
                              color: notifire.textcolor,
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          name[index],
                          style: TextStyle(
                              color: notifire.greytextcolor,
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          number2[index],
                          style: const TextStyle(
                              color: Color(0xff0038D9),
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width * 0.465,
                          lineHeight: MediaQuery.of(context).size.height * 0.01,
                          percent: indicator1[index],
                          isRTL: true,
                          barRadius: const Radius.circular(10),
                          backgroundColor: notifire.Linearindicatorcolor1,
                          progressColor: color[index],
                        ),
                        LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width * 0.465,
                          lineHeight: MediaQuery.of(context).size.height * 0.01,
                          percent: indicator2[index],
                          barRadius: const Radius.circular(10),
                          backgroundColor: notifire.Linearindicatorcolor1,
                          progressColor: color2[index],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                ],
              );
            }));
  }
}
