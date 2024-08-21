// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:goscore/theme/thememanager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class notifications extends StatefulWidget {
  const notifications({Key? key}) : super(key: key);

  @override
  State<notifications> createState() => _notificationState();
}

class _notificationState extends State<notifications> {
  List<Items> Item = [
    Items(
      id: 0,
      title: "Discount Available",
      image: "assets/discount.png",
      subtitle: "We recommend a 10% discount for parking around Jakarta area.",
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
      subtitle: "Your payment for Grand Indonesia at 09.12  successful.",
    ),
    Items(
      id: 1,
      title: "Payment Failed",
      image: "assets/pfailed.png",
      subtitle:
          "Your payment failed, please check you internet connection and try again.0",
    ),
    Items(
      id: 2,
      title: "You have 15 minutes left!",
      image: "assets/carleft.png",
      subtitle: "You should check out from the Senayan Central Park at 15.00",
    ),
    Items(
      id: 3,
      title: "You have 15 minutes left!",
      image: "assets/scooterleft.png",
      subtitle: "You should check out from the Tenis Indoor Senayan at 19.00",
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
        // automaticallyImplyLeading: true,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                children: [
                  Text('Today',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: notifire.greytextcolor,
                          fontSize: 12,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Card(
                      //elevation: 0.5,
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        tileColor: notifire.checkboxlistilecolor,
                        leading: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Image.asset("${Item[index].image}"),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            "${Item[index].title}",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: notifire.textcolor,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 3, bottom: 4),
                          child: Text(
                            "${Item[index].subtitle}",
                            softWrap: true,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 10,
                                color: notifire.greytextcolor,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        trailing: Padding(
                          padding: const EdgeInsets.only(bottom: 24.0),
                          child: Text(
                            '3 hours ago',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 10,
                                color: notifire.greytextcolor,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                children: [
                  Text('Yesterday',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: notifire.greytextcolor,
                          fontSize: 12,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Card(
                      //elevation: 0.5,
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        tileColor: notifire.checkboxlistilecolor,
                        leading: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Image.asset("${Item1[index].image}"),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            "${Item1[index].title}",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: notifire.textcolor,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 3, bottom: 4),
                          child: Text(
                            "${Item1[index].subtitle}",
                            softWrap: true,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 10,
                                color: notifire.greytextcolor,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        trailing: Padding(
                          padding: const EdgeInsets.only(bottom: 24.0),
                          child: Text(
                            '3 hours ago',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 10,
                                color: notifire.greytextcolor,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
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
