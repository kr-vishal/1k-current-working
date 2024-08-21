// ignore_for_file: camel_case_types

import 'package:goscore/home.dart';
import 'package:goscore/includes/common.dart';
import 'package:goscore/theme/thememanager.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'news.dart';
import 'newspageofbottombar.dart';
import 'premierleague.dart';

class tabbar extends StatefulWidget {
  const tabbar({Key? key}) : super(key: key);

  @override
  State<tabbar> createState() => _tabbarState();
}

class _tabbarState extends State<tabbar> {
  int pageIndex = 0;
  final pages = [
    const home(),
    const premierleague(),
    const newspageofbottombar(),
    const news(),

    ///video page of bottombar
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

  _tabbarState() {
    checkUserLogin();
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.backgroundallscreencolor,
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.085,
        color: notifire.backgroundallscreencolor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
                onTap: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                child: Container(
                  color: notifire.backgroundallscreencolor,
                  width: MediaQuery.of(context).size.width / 5,
                  child: Image.asset(
                    'assets/tabbar1.png',
                    scale: 2,
                    color: pageIndex == 0
                        ? notifire.textcolor
                        : const Color(0xff8E8E93),
                  ),
                )),
            InkWell(
                onTap: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                child: Container(
                  color: notifire.backgroundallscreencolor,
                  width: MediaQuery.of(context).size.width / 5,
                  child: Image.asset(
                    'assets/tabbar2.png',
                    scale: 2,
                    color: pageIndex == 1
                        ? notifire.textcolor
                        : const Color(0xff8E8E93),
                  ),
                )),
            InkWell(
                onTap: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                child: SizedBox(
                  // color: Colors.red,
                  width: MediaQuery.of(context).size.width / 5,
                  child: Image.asset(
                    'assets/tabbar3.png',
                    scale: 2,
                    color: pageIndex == 2
                        ? notifire.textcolor
                        : const Color(0xff8E8E93),
                  ),
                )),
            InkWell(
              onTap: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              child: SizedBox(
                // color: Colors.red,
                width: MediaQuery.of(context).size.width / 5,
                child: Image.asset(
                  'assets/tabbar4.png',
                  scale: 2,
                  color: pageIndex == 3
                      ? notifire.textcolor
                      : const Color(0xff8E8E93),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
