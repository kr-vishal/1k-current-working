// ignore_for_file: camel_case_types

import 'package:goscore/hotnewsoftabnews.dart';
import 'package:goscore/predictionsoftabnews.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:goscore/transfernewsoftabnews.dart';
import 'package:badges/badges.dart' as badge_alias;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'notificationlisthomeshow.dart';

class newspageofbottombar extends StatefulWidget {
  const newspageofbottombar({Key? key}) : super(key: key);

  @override
  State<newspageofbottombar> createState() => _newspageofbottombarState();
}

class _newspageofbottombarState extends State<newspageofbottombar>
    with SingleTickerProviderStateMixin {
  int index = 0;
  late TabController _tabController;
  final pages = [const hotnews(), const predictions(), const transfer()];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: notifire.backgroundallscreencolor,
        leadingWidth: MediaQuery.of(context).size.width * 0.2,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            'assets/Menu2.png',
            scale: 2,
            color: notifire.textcolor,
          ),
        ),
        centerTitle: true,
        title: Text(
          'News',
          style: TextStyle(
              fontFamily: 'Poppins',
              color: notifire.textcolor,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
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
          const SizedBox(width: 5),
        ],
      ),
      backgroundColor: notifire.backgroundallscreencolor,
      body: Column(
        children: [
          Container(
            color: notifire.backgroundallscreencolor,
            child: DefaultTabController(
              length: 5,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: TabBar(
                  isScrollable: true,
                  indicatorPadding: const EdgeInsets.only(bottom: 2),
                  unselectedLabelColor: Colors.grey,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                      border: Border.all(
                        color: notifire.bordercolor,
                      ),
                      borderRadius: BorderRadius.circular(24),
                      color: const Color(0xff0038D9)),
                  tabs: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.26,
                      height: MediaQuery.of(context).size.height * 0.055,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: notifire.bordercolor,
                          )),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Hot News',
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.30,
                      height: MediaQuery.of(context).size.height * 0.055,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                              color: notifire.bordercolor, width: 1)),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Predictions',
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.36,
                      height: MediaQuery.of(context).size.height * 0.055,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                              color: notifire.bordercolor, width: 1)),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Transfer News',
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
          ),
        ],
      ),
    );
  }
}
