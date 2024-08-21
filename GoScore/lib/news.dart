
// ignore_for_file: camel_case_types, use_full_hex_values_for_flutter_colors

import 'package:goscore/theme/thememanager.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:goscore/stringfile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class news extends StatefulWidget {
  const news({Key? key}) : super(key: key);

  @override
  State<news> createState() => _newsState();
}

class _newsState extends State<news> {
  final List image = [
    'assets/Video3.png',
    'assets/Video4.png',
    'assets/Video3.png',
  ];

  final List logo = [
    'assets/mancity2.png',
    'assets/barcelona.png',
  ];
  final List youtube = [
    'assets/video5.png',
    'assets/video6.png',
  ];
  final List teamname = [
    Apptext.manchester,
    Apptext.ChelseaFC,
  ];
  final List min = [
    Apptext.min,
    Apptext.min,
  ];
  final List news = [
    Apptext.Licha,
    Apptext.failed,
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
          Apptext.watch,
          style: TextStyle(
              color: notifire.textcolor,
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Image.asset(
              'assets/Notification2.png',
              scale: 2,
              color: notifire.textcolor,
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
      backgroundColor: notifire.backgroundallscreencolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.27,
                child: ListView.builder(
                  itemCount: 3,
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 0.5,
                      color: notifire.backgroundcolor2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.36,
                        decoration: BoxDecoration(
                            color: notifire.backgroundcolor2,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(image[index]),
                                fit: BoxFit.fill)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            BlurryContainer(
                              height: MediaQuery.of(context).size.height * 0.04,
                              width: MediaQuery.of(context).size.width * 0.28,
                              blur: 10,
                              color: const Color(0xffffffff1f).withOpacity(0.1),
                              elevation: 0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset('assets/eye.png'),
                                  const Text(
                                    Apptext.views,
                                    style: TextStyle(
                                        color: Color(0xffFFFFFF),
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.015,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              ListView.builder(
                itemCount: 2,
                padding: EdgeInsets.zero,
                itemExtent: 280,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    color: notifire.backgroundcolor2,
                    elevation: 0.5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      decoration: BoxDecoration(
                        color: notifire.backgroundcolor2,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            logo[index],
                                            scale: 24.5,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                teamname[index],
                                                style: TextStyle(
                                                    color: notifire.textcolor,
                                                    fontFamily: 'Poppins',
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(height: 2),
                                              Text(
                                                min[index],
                                                style: TextStyle(
                                                    color:
                                                        notifire.greytextcolor,
                                                    fontFamily: 'Poppins',
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.more_horiz,
                                              color: notifire.textcolor)
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        child: Text(
                                          news[index],
                                          style: TextStyle(
                                              color: notifire.textcolor,
                                              fontFamily: 'Poppins',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7),
                              child: Column(
                                children: [
                                  Card(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.20,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              //color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      youtube[index]),
                                                  fit: BoxFit.fill)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/Play.png',
                                                scale: 1.5,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.15,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.02,
                                                ),
                                                BlurryContainer(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.04,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.28,
                                                  blur: 10,
                                                  color: const Color(0xffFFFFFF1F)
                                                      .withOpacity(0.1),
                                                  elevation: 0,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Image.asset(
                                                          'assets/eye.png'),
                                                      const Text(
                                                        Apptext.views,
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xffFFFFFF),
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
