import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goscore/allmatch.dart';
import 'package:goscore/contactus.dart';
import 'package:goscore/editprofile.dart';
import 'package:goscore/help.dart';
import 'package:goscore/includes/common.dart';
import 'package:goscore/news.dart';
import 'package:goscore/newspageofbottombar.dart';
import 'package:goscore/notification.dart';
import 'package:goscore/privacy.dart';
import 'package:goscore/stringfile.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:goscore/todaymatchalldetails.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool darkmode = false;

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

  @override
  void initState() {
    getdarkmodepreviousstate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.3,
      backgroundColor: notifire.backgroundallscreencolor,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                    Text(
                      Apptext.homeapp,
                      style: TextStyle(
                          color: notifire.textcolor,
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/ic_home.png',
                            scale: 4,
                            color: notifire.textcolor,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text(
                            Apptext.home,
                            style: TextStyle(
                                color: notifire.textcolor,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const allmatch());
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/calendar.png',
                            scale: 2,
                            color: notifire.textcolor,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text(
                            Apptext.schedule,
                            style: TextStyle(
                                color: notifire.textcolor,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const newspageofbottombar());
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/news.png',
                            scale: 2,
                            color: notifire.textcolor,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text(
                            Apptext.news,
                            style: TextStyle(
                                color: notifire.textcolor,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const news());
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/video.png',
                            scale: 2,
                            color: notifire.textcolor,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text(
                            Apptext.video,
                            style: TextStyle(
                                color: notifire.textcolor,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Text(
                      Apptext.setting,
                      style: TextStyle(
                          color: notifire.greytextcolor,
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const notification());
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/notification3.png',
                            scale: 2,
                            color: notifire.textcolor,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text(
                            Apptext.notification,
                            style: TextStyle(
                                color: notifire.textcolor,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const todaymatchalldetails(
                          matches: [],
                        ));
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/star.png',
                            scale: 2,
                            color: notifire.textcolor,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text(
                            Apptext.favourites,
                            style: TextStyle(
                                color: notifire.textcolor,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/moon.png',
                          scale: 2,
                          color: notifire.textcolor,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Row(
                          children: [
                            Text(
                              Apptext.dark,
                              style: TextStyle(
                                  color: notifire.textcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.24,
                            ),
                            Transform.scale(
                              scale: 0.8,
                              child: CupertinoSwitch(
                                value: darkmode,
                                activeColor: const Color(0xff0038D9),
                                onChanged: (bool value) async {
                                  setState(() {
                                    darkmode = value;
                                  });
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  setState(
                                    () {
                                      notifire.setIsDark = value;
                                      prefs.setBool("setIsDark", value);
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Text(
                      Apptext.info,
                      style: TextStyle(
                          color: notifire.greytextcolor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const help());
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/info.png',
                            scale: 2,
                            color: notifire.textcolor,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text(
                            Apptext.help,
                            style: TextStyle(
                                color: notifire.textcolor,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const privacy());
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/shield.png',
                            scale: 2,
                            color: notifire.textcolor,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text(
                            Apptext.privacy,
                            style: TextStyle(
                                color: notifire.textcolor,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const newspageofbottombar());
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/news2.png',
                            scale: 2,
                            color: notifire.textcolor,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text(
                            Apptext.publiser,
                            style: TextStyle(
                                color: notifire.textcolor,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const contactus());
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/messages.png',
                            scale: 2,
                            color: notifire.textcolor,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text(
                            Apptext.contact,
                            style: TextStyle(
                                color: notifire.textcolor,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    InkWell(
                      onTap: () {
                        userlogout();
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/info.png',
                            scale: 2,
                            color: notifire.textcolor,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text(
                            Apptext.logout,
                            style: TextStyle(
                                color: notifire.textcolor,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.052),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(const editprofile());
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                maxRadius:
                                    MediaQuery.of(context).size.height * 0.03,
                                backgroundImage:
                                    const AssetImage('assets/Avatar2.png'),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Apptext.drawername,
                                    style: TextStyle(
                                        color: notifire.textcolor,
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    Apptext.overs,
                                    style: TextStyle(
                                        color: notifire.greytextcolor,
                                        fontSize: 10,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 83,
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: notifire.textcolor,
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
