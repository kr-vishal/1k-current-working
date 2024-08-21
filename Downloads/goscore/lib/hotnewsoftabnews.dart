// ignore_for_file: camel_case_types, use_full_hex_values_for_flutter_colors

import 'package:goscore/theme/thememanager.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:goscore/predictionsnewsontap.dart';
import 'package:goscore/stringfile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class hotnews extends StatefulWidget {
  const hotnews({Key? key}) : super(key: key);

  @override
  State<hotnews> createState() => _hotnewsState();
}

class _hotnewsState extends State<hotnews> {
  final List logo = [
    'assets/Ellipse382.png',
    'assets/Ellipse382.png',
  ];
  final List youtube = [
    'assets/news1.png',
    'assets/news3.png',
  ];
  final List teamname = [
    Apptext.LewisJones,
    Apptext.LewisJones,
  ];
  final List min = [
    Apptext.SkySports,
    Apptext.SkySports,
  ];
  final List news = [
    Apptext.Premier,
    Apptext.Realmadrid,
  ];
  TextEditingController commentcontroller1 = TextEditingController();
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              ListView.builder(
                itemCount: 2,
                padding: EdgeInsets.zero,
                itemExtent: 340,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(const predictionsnewsontap());
                    },
                    child: Card(
                      elevation: 0.5,
                      color: notifire.backgroundcolor2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.35,
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
                                              scale: 1.5,
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
                                                Text(
                                                  min[index],
                                                  style: TextStyle(
                                                      color: notifire
                                                          .greytextcolor,
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
                                            Icon(
                                              Icons.more_horiz,
                                              color: notifire.textcolor,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
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
                                      color: notifire.checkboxlistilecolor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Stack(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.to(
                                                  const predictionsnewsontap());
                                            },
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.20,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  color: notifire
                                                      .checkboxlistilecolor,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          youtube[index]),
                                                      fit: BoxFit.fill)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
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
                                                  color:
                                                      const Color(0xffffffff1f)
                                                          .withOpacity(0.1),
                                                  elevation: 0,
                                                  child: const Center(
                                                    child: Text(
                                                      Apptext.Predictions,
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xffFFFFFF),
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 6),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                              'assets/heart2.png',
                                              color: notifire.textcolor,
                                              scale: 4),
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '980',
                                          style: TextStyle(
                                              color: notifire.greytextcolor,
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const SizedBox(width: 12),
                                        InkWell(
                                          onTap: () {
                                            showModalBottomSheet<void>(
                                              isScrollControlled: true,
                                              isDismissible: true,
                                              useRootNavigator: true,
                                              barrierColor:
                                                  Colors.black.withOpacity(0.5),
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (BuildContext context) {
                                                return StatefulBuilder(
                                                  builder: (BuildContext
                                                          context,
                                                      StateSetter setState) {
                                                    return Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.90,
                                                      decoration: BoxDecoration(
                                                        color: notifire
                                                            .checkboxlistilecolor,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  20),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.only(
                                                            bottom:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .viewInsets
                                                                    .bottom),
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            //mainAxisSize: MainAxisSize.min,
                                                            children: <Widget>[
                                                              Stack(
                                                                children: [
                                                                  SizedBox(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        56.0,
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        "Comment",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                notifire.textcolor,
                                                                            fontWeight: FontWeight.w600,
                                                                            fontFamily: "Poppins"),
                                                                      ), // Your desired title
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    left: 24.0,
                                                                    top: 18.0,
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: Icon(
                                                                          Icons
                                                                              .close,
                                                                          color:
                                                                              notifire.textcolor),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        22.0),
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child: ListView
                                                                      .builder(
                                                                          itemCount:
                                                                              5,
                                                                          shrinkWrap:
                                                                              true,
                                                                          itemExtent:
                                                                              120,
                                                                          physics:
                                                                              const BouncingScrollPhysics(),
                                                                          scrollDirection: Axis
                                                                              .vertical,
                                                                          itemBuilder:
                                                                              (BuildContext context, int index) {
                                                                            return ListTile(
                                                                              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                                                                              leading: CircleAvatar(
                                                                                child: Positioned(
                                                                                  top: 0,
                                                                                  child: Image.asset(
                                                                                    'assets/Ellipse 38.png',
                                                                                    scale: 1.5,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              title: Row(
                                                                                children: [
                                                                                  Text(
                                                                                    'Lewis Jones',
                                                                                    style: TextStyle(color: notifire.textcolor, fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w500),
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    width: 12,
                                                                                  ),
                                                                                  Text(
                                                                                    '30 min ago',
                                                                                    style: TextStyle(color: notifire.greytextcolor, fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w400),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              subtitle: Column(
                                                                                children: [
                                                                                  Text(
                                                                                    'Man City have already qualified for the knockout stages and can win the group if they avoid defeat at Borussia Dortmund on Tuesday.',
                                                                                    style: TextStyle(color: notifire.textcolor, fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w400),
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    height: 16,
                                                                                  ),
                                                                                  Row(
                                                                                    children: [
                                                                                      Row(
                                                                                        children: [
                                                                                          InkWell(
                                                                                            onTap: () {},
                                                                                            child: Image.asset(
                                                                                              'assets/heart2.png',
                                                                                              scale: 4,
                                                                                              color: notifire.textcolor,
                                                                                            ),
                                                                                          ),
                                                                                          const SizedBox(width: 4),
                                                                                          Text(
                                                                                            '980',
                                                                                            style: TextStyle(color: notifire.greytextcolor, fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w400),
                                                                                          ),
                                                                                          const SizedBox(width: 12),
                                                                                          InkWell(
                                                                                            onTap: () {},
                                                                                            child: Image.asset(
                                                                                              'assets/message.png',
                                                                                              scale: 4,
                                                                                              color: notifire.textcolor,
                                                                                            ),
                                                                                          ),
                                                                                          const SizedBox(width: 4),
                                                                                          Text(
                                                                                            '98',
                                                                                            style: TextStyle(color: notifire.greytextcolor, fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w400),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            );
                                                                          }),
                                                                ),
                                                              ),
                                                              Container(
                                                                color: notifire
                                                                    .backgroundcolor2,
                                                                alignment: Alignment
                                                                    .bottomCenter,
                                                                child:
                                                                    TextField(
                                                                  // controller:
                                                                  //     commentController2,
                                                                  decoration:
                                                                      InputDecoration(
                                                                          hintText:
                                                                              "Write Comment...",
                                                                          contentPadding: const EdgeInsets.only(
                                                                              left:
                                                                                  20,
                                                                              top:
                                                                                  16),
                                                                          suffixIcon:
                                                                              InkWell(
                                                                            onTap:
                                                                                () {},
                                                                            child:
                                                                                Image.asset('assets/sendmsg.png', scale: 3.7),
                                                                          ),
                                                                          isDense:
                                                                              true,
                                                                          hintStyle: const TextStyle(
                                                                              color: Color(0xffAEAEB2),
                                                                              fontSize: 14,
                                                                              fontFamily: 'Poppins',
                                                                              fontWeight: FontWeight.w500),
                                                                          border: InputBorder.none),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          },
                                          child: Image.asset(
                                              'assets/message.png',
                                              scale: 4,
                                              color: notifire.textcolor),
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '98',
                                          style: TextStyle(
                                              color: notifire.greytextcolor,
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Image.asset('assets/send-2.png',
                                          scale: 4, color: notifire.textcolor),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 4),
                            ],
                          ),
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
