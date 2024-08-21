// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:ui';

import 'package:goscore/stringfile.dart';
import 'package:goscore/tabbar.dart';
import 'package:goscore/theme/thememanager.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class favouriteclub extends StatefulWidget {
  const favouriteclub({Key? key}) : super(key: key);

  @override
  State<favouriteclub> createState() => _favouriteclubState();
}

class _favouriteclubState extends State<favouriteclub> {
  final List images = [
    'assets/Badges1.png',
    'assets/Badges2.png',
    'assets/Badges3.png',
    'assets/Badges4.png',
    'assets/Badges5.png',
    'assets/Badges6.png',
  ];
  final List name = [
    Apptext.club1,
    Apptext.club2,
    Apptext.club3,
    Apptext.club4,
    Apptext.club5,
    Apptext.club6,
  ];
  var ischecked;

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
                Apptext.favourite,
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
                  itemCount: images.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
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
                                    scale: 2.5,
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
                    backgroundColor: notifire.checkboxlistilecolor,
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.black,
                    ),
                  );
                },
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Dialog(
                                backgroundColor: Colors.transparent,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  decoration: BoxDecoration(
                                      color: notifire.checkboxlistilecolor,
                                      borderRadius: BorderRadius.circular(24)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                              text: Apptext.dilog1,
                                              style: TextStyle(
                                                color: notifire.greytextcolor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Poppins',
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: Apptext.dilog2,
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: notifire
                                                        .dialogtextcolor,
                                                  ),
                                                ),
                                                const TextSpan(
                                                    text: Apptext.dilog3,
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xff8E8E93),
                                                    ))
                                              ]),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.to(const tabbar());
                                          },
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.06,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.45,
                                            decoration: BoxDecoration(
                                                color: const Color(0xff0038D9),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: const Center(
                                              child: Text(
                                                Apptext.agree,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    fontFamily: 'poppins',
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: const Text(
                                            Apptext.disgree,
                                            style: TextStyle(
                                              fontFamily: 'poppins',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Color(0xff0038D9),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.062,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color(0xff0038D9),
                        borderRadius: BorderRadius.circular(24)),
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
