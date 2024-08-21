// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:goscore/includes/common.dart';
import 'package:goscore/stringfile.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'favouriteclub.dart';

class followleague extends StatefulWidget {
  const followleague({Key? key}) : super(key: key);

  @override
  State<followleague> createState() => _followleagueState();
}

class _followleagueState extends State<followleague> {
  final List images = [
    'assets/league1.png',
    'assets/laliga2.png',
    'assets/image3.png',
    'assets/image4.png',
    'assets/image5.png',
    'assets/image6.png',
  ];
  final List name = [
    Apptext.League1,
    Apptext.League2,
    Apptext.League3,
    Apptext.League4,
    Apptext.League5,
    Apptext.League6,
  ];
  final List bname = [
    Apptext.brecket1,
    Apptext.brecket2,
    Apptext.brecket3,
    Apptext.brecket4,
    Apptext.brecket5,
    Apptext.brecket6,
  ];
  var ischecked;
  late ColorNotifire notifire;

  _followleagueState(){
    checkUserLogin();
  }

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
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Apptext.follow,
                style: TextStyle(
                    color: notifire.textcolor,
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                width: 250,
                child: Text(
                  Apptext.sellect,
                  style: TextStyle(
                      color: notifire.greytextcolor,
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              TextField(
                style: TextStyle(color: notifire.textcolor),
                decoration: InputDecoration(
                    hintText: Apptext.search,
                    hintStyle: const TextStyle(
                        color: Color(0xffAEAEB2),
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset(
                        'assets/Seacrh.png',
                        scale: 4,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: notifire.bordercolor),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: notifire.bordercolor),
                      borderRadius: BorderRadius.circular(24),
                    )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: images.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  // itemExtent: 100,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          ischecked = index;
                        });
                      },
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 14,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: notifire.checkboxlistilecolor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.04,
                                  ),
                                  Image.asset(
                                    images[index],
                                    scale: 3,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.02,
                                  ),
                                  Text(
                                    name[index],
                                    style: TextStyle(
                                        color: notifire.textcolor,
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                  Text(
                                    bname[index],
                                    style: TextStyle(
                                        color: notifire.greytextcolor,
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: ischecked == index ? true : false,
                                    shape: const CircleBorder(),
                                    onChanged: (context) {},
                                    activeColor: Colors.green,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ]),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Dialog(
                    backgroundColor: Colors.red,
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.black,
                    ),
                  );
                },
                child: InkWell(
                  onTap: () {
                    Get.to(const favouriteclub());
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.062,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color(0xff0038D9),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        Apptext.next,
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
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
