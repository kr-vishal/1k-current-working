// ignore_for_file: camel_case_types

import 'package:goscore/h2h.dart';
import 'package:goscore/lineups.dart';
import 'package:goscore/stats.dart';
import 'package:goscore/stringfile.dart';
import 'package:goscore/summary.dart';
import 'package:goscore/tables.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:goscore/models/match.dart';

class MatchDetail extends StatefulWidget {
  final Match match;
  const MatchDetail({Key? key, required this.match}) : super(key: key);

  @override
  State<MatchDetail> createState() => _MatchDetailState();
}

class _MatchDetailState extends State<MatchDetail>
    with SingleTickerProviderStateMixin {
  int index = 0;
  final pages = [
    const stats(),
    const summary(),
    const lineups(),
    //const h2h(),
    const tables()
  ];
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

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
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xff0038D9),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    image: DecorationImage(
                      image: const AssetImage(
                        'assets/Patern.png',
                      ),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.2), BlendMode.dstATop),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: CircleAvatar(
                                backgroundColor:
                                    const Color(0xffFFFFFF).withOpacity(0.15),
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const Text(
                              Apptext.League1,
                              style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            CircleAvatar(
                              backgroundColor:
                                  const Color(0xffFFFFFF).withOpacity(0.15),
                              child: const Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 0.0,
                        borderOnForeground: true,
                        color: notifire.backgroundallscreencolor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          height: 178,
                          width: 328,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: notifire.backgroundallscreencolor,
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 12),
                              Text(
                                widget.match.stadium.name,
                                style: TextStyle(
                                    color: notifire.textcolor,
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 28.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 32,
                                          child: Image.network(
                                              widget.match.homeTeam.icon),
                                        ),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01),
                                        Text(
                                          widget.match.homeTeam.name,
                                          style: TextStyle(
                                              color: notifire.textcolor,
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
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            // crossAxisAlignment:
                                            //     CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                widget.match.homeTeamScore
                                                    .toString(),
                                                style: TextStyle(
                                                    color: notifire.textcolor,
                                                    fontFamily: 'Poppins',
                                                    fontSize: 32,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                ':',
                                                style: TextStyle(
                                                    color: notifire.textcolor,
                                                    fontFamily: 'Poppins',
                                                    fontSize: 32,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                widget.match.awayTeamScore
                                                    .toString(),
                                                style: TextStyle(
                                                    color: notifire.textcolor,
                                                    fontFamily: 'Poppins',
                                                    fontSize: 32,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01),
                                          Container(
                                            alignment: Alignment.center,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.028,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.12,
                                            decoration: BoxDecoration(
                                                color: const Color(0xff34C759)
                                                    .withOpacity(0.08),
                                                border: Border.all(
                                                    color: const Color(
                                                        0xff00C566)),
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
                                          child: Image.network(
                                            widget.match.awayTeam.icon,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01),
                                        Text(
                                          widget.match.awayTeam.name,
                                          style: TextStyle(
                                              color: notifire.textcolor,
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
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Container(
              color: notifire.backgroundallscreencolor,
              child: DefaultTabController(
                length: 4,
                child: TabBar(
                  isScrollable: true,
                  indicatorPadding: const EdgeInsets.only(bottom: 2),
                  unselectedLabelColor: Colors.grey,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                      border: Border.all(color: notifire.bordercolor),
                      borderRadius: BorderRadius.circular(24),
                      color: const Color(0xff0038D9)),
                  tabs: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.055,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: notifire.bordercolor),
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          Apptext.stats,
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.055,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                              color: notifire.bordercolor, width: 1)),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          Apptext.summary,
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.22,
                      height: MediaQuery.of(context).size.height * 0.055,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                              color: notifire.bordercolor, width: 1)),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          Apptext.lineups,
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                    /* Container(
                      width: MediaQuery.of(context).size.width * 0.18,
                      height: MediaQuery.of(context).size.height * 0.055,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                              color: notifire.bordercolor, width: 1)),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          Apptext.h2h,
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                      ),
                    ), */
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.055,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: notifire.bordercolor,
                          )),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          Apptext.tables,
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                  ],
                  controller: _tabController,
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: pages,
            ),
          )
        ],
      ),
    );
  }
}
