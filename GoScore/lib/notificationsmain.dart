// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:goscore/theme/thememanager.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class notificationsmain extends StatefulWidget {
  const notificationsmain({Key? key}) : super(key: key);

  @override
  State<notificationsmain> createState() => _notificationsmainState();
}

class _notificationsmainState extends State<notificationsmain> {
  List<Items> Item = [
    Items(
      id: 0,
      title: "Discount Available",
      image: "assets/discount.png",
      subtitle:
          "We recommend a 10% discount for parking\n around Jakarta area.",
    ),
    Items(
      id: 1,
      title: "You have 15 minutes left!",
      image: "assets/timeleft.png",
      subtitle: "You should check out from the Grand Indonesia.",
    ),
  ];
  List<Items> Item1 = [
    Items(
      id: 0,
      title: "Payment Success!",
      image: "assets/psuccess.png",
      subtitle: "Your payment for Grand Indonesia at 09.12 \n successful.",
    ),
    Items(
      id: 1,
      title: "Payment Failed",
      image: "assets/pfailed.png",
      subtitle:
          "Your payment failed, please check you internet \n connection and try again.0",
    ),
    Items(
      id: 2,
      title: "You have 15 minutes left!",
      image: "assets/carleft.png",
      subtitle: "You should check out from the Senayan Central\n Park at 15.00",
    ),
    Items(
      id: 3,
      title: "You have 15 minutes left!",
      image: "assets/scooterleft.png",
      subtitle: "You should check out from the Tenis Indoor\nSenayan at 19.00",
    ),
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
        //automaticallyImplyLeading: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Image.asset('assets/Menu2.png',
                scale: 2, color: notifire.textcolor),
          ),
        ),
        backgroundColor: notifire.backgroundallscreencolor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Notifications',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: notifire.textcolor),
        ),
      ),
      backgroundColor: notifire.backgroundallscreencolor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            child: Text('Today',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: notifire.greytextcolor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: notifire.backgroundallscreencolor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Expanded(
                          child: Card(
                            margin: const EdgeInsets.only(bottom: 15),
                            color: notifire.checkboxlistilecolor,
                            elevation: 0.2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      //color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "${Item[index].image}"),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 16,
                                              width: 140,
                                              child: Text(
                                                "${Item[index].title}",
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    color: notifire.textcolor,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            Text(
                                              '3 hours ago',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 10,
                                                  color: notifire.greytextcolor,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top: 5),
                                          child: Text(
                                            "${Item[index].subtitle}",
                                            softWrap: true,
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 9.6,
                                                color: notifire.greytextcolor,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            child: Text('YESTERDAY',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: notifire.greytextcolor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: notifire.backgroundallscreencolor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Expanded(
                              child: Card(
                                margin: const EdgeInsets.only(bottom: 15),
                                color: notifire.checkboxlistilecolor,
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 13, horizontal: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          //color: Colors.white,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "${Item1[index].image}"),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Padding(
                                        padding: const EdgeInsets.only(),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 16,
                                                  width: 140,
                                                  child: Text(
                                                    "${Item1[index].title}",
                                                    style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14,
                                                        color:
                                                            notifire.textcolor,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                                Positioned(
                                                  right: 0,
                                                  child: Text(
                                                    '3 hours ago',
                                                    style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 10,
                                                        color: notifire
                                                            .greytextcolor,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.only(top: 5),
                                              child: Text(
                                                "${Item1[index].subtitle}",
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 9.6,
                                                    color:
                                                        notifire.greytextcolor,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ));
                  },
                )),
          ),
        ]),
      ),
    );
  }
}

class Items {
  int? id;
  String? title;
  String? subtitle;
  String? image;

  Items({
    this.id,
    this.title,
    this.subtitle,
    this.image,
  });
}

class Items1 {
  int? id;
  String? title;
  String? subtitle;
  String? image;

  Items1({
    this.id,
    this.title,
    this.subtitle,
    this.image,
  });
}
