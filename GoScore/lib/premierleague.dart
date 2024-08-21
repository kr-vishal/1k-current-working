// ignore_for_file: camel_case_types

import 'dart:ui';

import 'package:goscore/detailnews.dart';
import 'package:goscore/detailplayerstats.dart';
import 'package:goscore/detailvideo.dart';
import 'package:goscore/includes/api.dart';
import 'package:goscore/includes/drawer.dart';
import 'package:goscore/privacy.dart';
import 'package:goscore/stringfile.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:goscore/todaymatchalldetails.dart';
import 'package:badges/badges.dart' as badge_alias;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'allmatch.dart';
import 'contactus.dart';
import 'detailmatch.dart';
import 'detailtables.dart';
import 'editprofile.dart';
import 'help.dart';
import 'home.dart';
import 'news.dart';
import 'newspageofbottombar.dart';
import 'notification.dart';
import 'notificationlisthomeshow.dart';
import 'package:goscore/models/match.dart';

class premierleague extends StatefulWidget {
  const premierleague({Key? key}) : super(key: key);

  @override
  State<premierleague> createState() => _premierleagueState();
}

class _premierleagueState extends State<premierleague>
    with SingleTickerProviderStateMixin {
  int index = 0;
  late TabController _tabController;
  final pages = [
    const detailmatch(),
    const detailtables(),
    const detailnews(),
    const detailvideo(),
    const detailplayerstats()
  ];

  List<Match> matches = [];

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    getdarkmodepreviousstate();
    super.initState();
  }

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

  bool darkmode = false;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      // drawer: BackdropFilter(
      //     filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
      //     child: Drawer(
      //       width: MediaQuery.of(context).size.width / 1.3,
      //       elevation: 0,
      //       child: Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 22),
      //         child: Row(
      //           children: [
      //             Column(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Column(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     SizedBox(
      //                       height: MediaQuery.of(context).size.height * 0.07,
      //                     ),
      //                     const Text(
      //                       Apptext.homeapp,
      //                       style: TextStyle(
      //                           color: Color(0xff1C1C1E),
      //                           fontFamily: 'Poppins',
      //                           fontSize: 18,
      //                           fontWeight: FontWeight.w600),
      //                     ),
      //                     SizedBox(
      //                       height: MediaQuery.of(context).size.height * 0.03,
      //                     ),
      //                     InkWell(
      //                       onTap: () {
      //                         Get.to(const home());
      //                       },
      //                       child: Row(
      //                         children: [
      //                           Image.asset(
      //                             'assets/ic_home.png',
      //                             scale: 4,
      //                           ),
      //                           SizedBox(
      //                             width:
      //                                 MediaQuery.of(context).size.width * 0.02,
      //                           ),
      //                           const Text(
      //                             Apptext.home,
      //                             style: TextStyle(
      //                                 color: Color(0xff1C1C1E),
      //                                 fontFamily: 'Poppins',
      //                                 fontSize: 14,
      //                                 fontWeight: FontWeight.w600),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       height: MediaQuery.of(context).size.height * 0.02,
      //                     ),
      //                     InkWell(
      //                       onTap: () {
      //                         Get.to(const allmatch());
      //                       },
      //                       child: Row(
      //                         children: [
      //                           Image.asset(
      //                             'assets/calendar.png',
      //                             scale: 2,
      //                           ),
      //                           SizedBox(
      //                             width:
      //                                 MediaQuery.of(context).size.width * 0.02,
      //                           ),
      //                           const Text(
      //                             Apptext.schedule,
      //                             style: TextStyle(
      //                                 color: Color(0xff1C1C1E),
      //                                 fontFamily: 'Poppins',
      //                                 fontSize: 14,
      //                                 fontWeight: FontWeight.w600),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       height: MediaQuery.of(context).size.height * 0.02,
      //                     ),
      //                     InkWell(
      //                       onTap: () {
      //                         Get.to(const news());
      //                       },
      //                       child: Row(
      //                         children: [
      //                           Image.asset(
      //                             'assets/news.png',
      //                             scale: 2,
      //                           ),
      //                           SizedBox(
      //                             width:
      //                                 MediaQuery.of(context).size.width * 0.02,
      //                           ),
      //                           const Text(
      //                             Apptext.news,
      //                             style: TextStyle(
      //                                 color: Color(0xff1C1C1E),
      //                                 fontFamily: 'Poppins',
      //                                 fontSize: 14,
      //                                 fontWeight: FontWeight.w600),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       height: MediaQuery.of(context).size.height * 0.02,
      //                     ),
      //                     Row(
      //                       children: [
      //                         Image.asset(
      //                           'assets/video.png',
      //                           scale: 2,
      //                         ),
      //                         SizedBox(
      //                           width: MediaQuery.of(context).size.width * 0.02,
      //                         ),
      //                         const Text(
      //                           Apptext.video,
      //                           style: TextStyle(
      //                               color: Color(0xff1C1C1E),
      //                               fontFamily: 'Poppins',
      //                               fontSize: 14,
      //                               fontWeight: FontWeight.w600),
      //                         ),
      //                       ],
      //                     ),
      //                     SizedBox(
      //                       height: MediaQuery.of(context).size.height * 0.03,
      //                     ),
      //                     const Text(
      //                       Apptext.setting,
      //                       style: TextStyle(
      //                           color: Color(0xff8E8E93),
      //                           fontFamily: 'Poppins',
      //                           fontSize: 12,
      //                           fontWeight: FontWeight.w500),
      //                     ),
      //                     SizedBox(
      //                       height: MediaQuery.of(context).size.height * 0.02,
      //                     ),
      //                     InkWell(
      //                       onTap: () {
      //                         Get.to(const notification());
      //                       },
      //                       child: Row(
      //                         children: [
      //                           Image.asset(
      //                             'assets/notification3.png',
      //                             scale: 2,
      //                           ),
      //                           SizedBox(
      //                             width:
      //                                 MediaQuery.of(context).size.width * 0.02,
      //                           ),
      //                           const Text(
      //                             Apptext.notification,
      //                             style: TextStyle(
      //                                 color: Color(0xff1C1C1E),
      //                                 fontFamily: 'Poppins',
      //                                 fontSize: 14,
      //                                 fontWeight: FontWeight.w600),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       height: MediaQuery.of(context).size.height * 0.02,
      //                     ),
      //                     Row(
      //                       children: [
      //                         Image.asset(
      //                           'assets/star.png',
      //                           scale: 2,
      //                         ),
      //                         SizedBox(
      //                           width: MediaQuery.of(context).size.width * 0.02,
      //                         ),
      //                         const Text(
      //                           Apptext.favourites,
      //                           style: TextStyle(
      //                               color: Color(0xff1C1C1E),
      //                               fontFamily: 'Poppins',
      //                               fontSize: 14,
      //                               fontWeight: FontWeight.w600),
      //                         ),
      //                       ],
      //                     ),
      //                     SizedBox(
      //                       height: MediaQuery.of(context).size.height * 0.01,
      //                     ),
      //                     Row(
      //                       children: [
      //                         Image.asset(
      //                           'assets/moon.png',
      //                           scale: 2,
      //                         ),
      //                         SizedBox(
      //                           width: MediaQuery.of(context).size.width * 0.02,
      //                         ),
      //                         Row(
      //                           mainAxisAlignment:
      //                               MainAxisAlignment.spaceBetween,
      //                           children: [
      //                             const Text(
      //                               Apptext.dark,
      //                               style: TextStyle(
      //                                   color: Color(0xff1C1C1E),
      //                                   fontFamily: 'Poppins',
      //                                   fontSize: 14,
      //                                   fontWeight: FontWeight.w600),
      //                             ),
      //                             SizedBox(
      //                               width: MediaQuery.of(context).size.width *
      //                                   0.24,
      //                             ),
      //                             Transform.scale(
      //                               scale: 0.8,
      //                               child: CupertinoSwitch(
      //                                 value: darkmode,
      //                                 onChanged: (bool? value) {
      //                                   setState(() {
      //                                     darkmode = value!;
      //                                   });
      //                                 },
      //                               ),
      //                             ),
      //
      //                             ///
      //                           ],
      //                         ),
      //                       ],
      //                     ),
      //                     SizedBox(
      //                       height: MediaQuery.of(context).size.height * 0.03,
      //                     ),
      //                     const Text(
      //                       Apptext.info,
      //                       style: TextStyle(
      //                           color: Color(0xff8E8E93),
      //                           fontSize: 12,
      //                           fontWeight: FontWeight.w500),
      //                     ),
      //                     SizedBox(
      //                       height: MediaQuery.of(context).size.height * 0.03,
      //                     ),
      //                     InkWell(
      //                       onTap: () {
      //                         Get.to(const help());
      //                       },
      //                       child: Row(
      //                         children: [
      //                           Image.asset(
      //                             'assets/info.png',
      //                             scale: 2,
      //                           ),
      //                           SizedBox(
      //                             width:
      //                                 MediaQuery.of(context).size.width * 0.02,
      //                           ),
      //                           const Text(
      //                             Apptext.help,
      //                             style: TextStyle(
      //                                 color: Color(0xff1C1C1E),
      //                                 fontFamily: 'Poppins',
      //                                 fontSize: 14,
      //                                 fontWeight: FontWeight.w600),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       height: MediaQuery.of(context).size.height * 0.02,
      //                     ),
      //                     InkWell(
      //                       onTap: () {
      //                         Get.to(const privacy());
      //                       },
      //                       child: Row(
      //                         children: [
      //                           Image.asset(
      //                             'assets/shield.png',
      //                             scale: 2,
      //                           ),
      //                           SizedBox(
      //                             width:
      //                                 MediaQuery.of(context).size.width * 0.02,
      //                           ),
      //                           const Text(
      //                             Apptext.privacy,
      //                             style: TextStyle(
      //                                 color: Color(0xff1C1C1E),
      //                                 fontFamily: 'Poppins',
      //                                 fontSize: 14,
      //                                 fontWeight: FontWeight.w600),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       height: MediaQuery.of(context).size.height * 0.02,
      //                     ),
      //                     Row(
      //                       children: [
      //                         Image.asset(
      //                           'assets/news2.png',
      //                           scale: 2,
      //                         ),
      //                         SizedBox(
      //                           width: MediaQuery.of(context).size.width * 0.02,
      //                         ),
      //                         const Text(
      //                           Apptext.publiser,
      //                           style: TextStyle(
      //                               color: Color(0xff1C1C1E),
      //                               fontFamily: 'Poppins',
      //                               fontSize: 14,
      //                               fontWeight: FontWeight.w600),
      //                         ),
      //                       ],
      //                     ),
      //                     SizedBox(
      //                       height: MediaQuery.of(context).size.height * 0.02,
      //                     ),
      //                     InkWell(
      //                       onTap: () {
      //                         Get.to(const contactus());
      //                       },
      //                       child: Row(
      //                         children: [
      //                           Image.asset(
      //                             'assets/messages.png',
      //                             scale: 2,
      //                           ),
      //                           SizedBox(
      //                             width:
      //                                 MediaQuery.of(context).size.width * 0.02,
      //                           ),
      //                           const Text(
      //                             Apptext.contact,
      //                             style: TextStyle(
      //                                 color: Color(0xff1C1C1E),
      //                                 fontFamily: 'Poppins',
      //                                 fontSize: 14,
      //                                 fontWeight: FontWeight.w600),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 Column(
      //                   children: [
      //                     InkWell(
      //                       onTap: () {
      //                         Get.to(const editprofile());
      //                       },
      //                       child: Row(
      //                         children: [
      //                           CircleAvatar(
      //                             maxRadius:
      //                                 MediaQuery.of(context).size.height * 0.03,
      //                             backgroundImage:
      //                                 const AssetImage('assets/Ellipse38.png'),
      //                           ),
      //                           SizedBox(
      //                             width:
      //                                 MediaQuery.of(context).size.width * 0.02,
      //                           ),
      //                           Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             children: const [
      //                               Text(
      //                                 Apptext.drawername,
      //                                 style: TextStyle(
      //                                     color: Color(0xff1C1C1E),
      //                                     fontSize: 14,
      //                                     fontFamily: 'Poppins',
      //                                     fontWeight: FontWeight.w600),
      //                               ),
      //                               Text(
      //                                 Apptext.overs,
      //                                 style: TextStyle(
      //                                     color: Color(0xff636366),
      //                                     fontSize: 10,
      //                                     fontFamily: 'Poppins',
      //                                     fontWeight: FontWeight.w400),
      //                               )
      //                             ],
      //                           ),
      //                           const SizedBox(
      //                             width: 83,
      //                           ),
      //                           const Icon(Icons.arrow_forward_ios_outlined)
      //                         ],
      //                       ),
      //                     )
      //                   ],
      //                 )
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
      //     )),
      drawer: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        child: const AppDrawer(),
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
        centerTitle: true,
        title: Text(
          Apptext.League1,
          style: TextStyle(
              color: notifire.textcolor,
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
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
          ),
        ],
      ),
      backgroundColor: notifire.backgroundallscreencolor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 22, right: 22),
            child: Container(
              color: notifire.backgroundallscreencolor,
              child: DefaultTabController(
                length: 5,
                child: TabBar(
                  isScrollable: true,
                  indicatorPadding: const EdgeInsets.only(bottom: 2),
                  unselectedLabelColor: Colors.grey,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  indicator: BoxDecoration(
                      border: Border.all(color: notifire.bordercolor),
                      borderRadius: BorderRadius.circular(24),
                      color: const Color(0xff0038D9)),
                  tabs: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.22,
                      height: MediaQuery.of(context).size.height * 0.055,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: notifire.bordercolor)),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          Apptext.match,
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
                          Apptext.tables,
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
                          Apptext.news,
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
                          Apptext.video,
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.32,
                      height: MediaQuery.of(context).size.height * 0.055,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: notifire.bordercolor,
                        ),
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          Apptext.player,
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
