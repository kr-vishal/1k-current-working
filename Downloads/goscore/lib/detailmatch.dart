// ignore_for_file: camel_case_types

import 'package:goscore/fixtures.dart';
import 'package:goscore/results.dart';
import 'package:goscore/stringfile.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class detailmatch extends StatefulWidget {
  const detailmatch({Key? key}) : super(key: key);

  @override
  State<detailmatch> createState() => _detailmatchState();
}

class _detailmatchState extends State<detailmatch>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final pages = [
    const fixtures(),
    const results(),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: notifire.backgroundallscreencolor,
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                  child: DefaultTabController(
                      length: 2,
                      child: TabBar(
                        unselectedLabelColor: notifire.greytextcolor,
                        labelColor: notifire.textcolor,
                        labelStyle: const TextStyle(fontFamily: 'Poppins'),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: notifire.checkboxlistilecolor,
                        ),
                        tabs: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                Apptext.Fixtures,
                                style: TextStyle(fontFamily: 'Poppins'),
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                Apptext.Results,
                                style: TextStyle(fontFamily: 'Poppins'),
                              ),
                            ),
                          ),
                        ],
                        controller: _tabController,
                      )),
                )),
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
