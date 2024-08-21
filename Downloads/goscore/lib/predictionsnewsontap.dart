// ignore_for_file: camel_case_types

import 'package:goscore/theme/thememanager.dart';
import 'package:badges/badges.dart' as badge_alias;
import 'package:goscore/stringfile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class predictionsnewsontap extends StatefulWidget {
  const predictionsnewsontap({Key? key}) : super(key: key);

  @override
  State<predictionsnewsontap> createState() => _predictionsnewsontapState();
}

class _predictionsnewsontapState extends State<predictionsnewsontap> {
  TextEditingController commentController = TextEditingController();
  TextEditingController commentController2 = TextEditingController();
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: notifire.backgroundallscreencolor,
        leadingWidth: MediaQuery.of(context).size.width * 0.2,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Image.asset('assets/Menu2.png',
              scale: 2, color: notifire.textcolor),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Image.asset('assets/morenoti.png',
                scale: 4, color: notifire.textcolor),
          ),
          const SizedBox(width: 5),
        ],
      ),
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: BottomAppBar(
            color: notifire.backgroundcolor2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Image.asset('assets/heart2.png',
                            scale: 3, color: notifire.textcolor),
                      ),
                      const SizedBox(width: 12),
                      badge_alias.Badge(
                        shape: badge_alias.BadgeShape.square,
                        toAnimate: true,
                        animationType: badge_alias.BadgeAnimationType.scale,
                        badgeColor: const Color(0xffFF4747),
                        position: badge_alias.BadgePosition.topEnd(
                            top: -12, end: -18),
                        borderRadius: BorderRadius.circular(12),
                        badgeContent: const Text(
                          "786",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                        ),
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet<void>(
                              isScrollControlled: true,
                              isDismissible: true,
                              useRootNavigator: true,
                              barrierColor: Colors.black.withOpacity(0.5),
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (BuildContext context) {
                                return StatefulBuilder(
                                  builder: (BuildContext context,
                                      StateSetter setState) {
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.90,
                                      decoration: BoxDecoration(
                                        color: notifire.checkboxlistilecolor,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            //mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Stack(
                                                children: [
                                                  SizedBox(
                                                    width: double.infinity,
                                                    height: 56.0,
                                                    child: Center(
                                                      child: Text(
                                                        "Comment",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: notifire
                                                                .textcolor,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontFamily:
                                                                "Poppins"),
                                                      ), // Your desired title
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 24.0,
                                                    top: 18.0,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Icon(Icons.close,
                                                          color: notifire
                                                              .textcolor),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 22.0),
                                                child: SingleChildScrollView(
                                                  child: ListView.builder(
                                                      itemCount: 5,
                                                      shrinkWrap: true,
                                                      itemExtent: 120,
                                                      physics:
                                                          const BouncingScrollPhysics(),
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return ListTile(
                                                          contentPadding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      0),
                                                          leading: CircleAvatar(
                                                            child: Positioned(
                                                              top: 0,
                                                              child:
                                                                  Image.asset(
                                                                'assets/Ellipse 38.png',
                                                                scale: 1.5,
                                                              ),
                                                            ),
                                                          ),
                                                          title: Row(
                                                            children: [
                                                              Text(
                                                                'Lewis Jones',
                                                                style: TextStyle(
                                                                    color: notifire
                                                                        .textcolor,
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                              const SizedBox(
                                                                width: 12,
                                                              ),
                                                              Text(
                                                                '30 min ago',
                                                                style: TextStyle(
                                                                    color: notifire
                                                                        .greytextcolor,
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                            ],
                                                          ),
                                                          subtitle: Column(
                                                            children: [
                                                              Text(
                                                                'Man City have already qualified for the knockout stages and can win the group if they avoid defeat at Borussia Dortmund on Tuesday.',
                                                                style: TextStyle(
                                                                    color: notifire
                                                                        .textcolor,
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                              const SizedBox(
                                                                height: 16,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {},
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/heart2.png',
                                                                          scale:
                                                                              4,
                                                                          color:
                                                                              notifire.textcolor,
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                          width:
                                                                              4),
                                                                      Text(
                                                                        '980',
                                                                        style: TextStyle(
                                                                            color: notifire
                                                                                .greytextcolor,
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w400),
                                                                      ),
                                                                      const SizedBox(
                                                                          width:
                                                                              12),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {},
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/message.png',
                                                                          scale:
                                                                              4,
                                                                          color:
                                                                              notifire.textcolor,
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                          width:
                                                                              4),
                                                                      Text(
                                                                        '98',
                                                                        style: TextStyle(
                                                                            color: notifire
                                                                                .greytextcolor,
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w400),
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
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: TextField(
                                                  style: TextStyle(
                                                      color: notifire.textcolor,
                                                      fontFamily: 'Poppins'),
                                                  controller:
                                                      commentController2,
                                                  decoration: InputDecoration(
                                                      //fillColor: Colors.grey,
                                                      focusColor: Colors.grey,
                                                      // fillColor: notifire
                                                      //     .dialogtextcolor,
                                                      hintText:
                                                          "Write Comment...",
                                                      contentPadding:
                                                          const EdgeInsets.only(
                                                              left: 20,
                                                              top: 16),
                                                      suffixIcon: InkWell(
                                                        onTap: () {},
                                                        child: Image.asset(
                                                            'assets/sendmsg.png',
                                                            scale: 3.7),
                                                      ),
                                                      isDense: true,
                                                      hintStyle:
                                                          const TextStyle(
                                                              color: Color(
                                                                  0xffAEAEB2),
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                      filled: true,
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
                            scale: 3,
                            color: notifire.textcolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                          fontFamily: 'Poppins', color: notifire.textcolor),
                      decoration: InputDecoration(
                          hintText: "Write Comment...",
                          contentPadding:
                              const EdgeInsets.only(left: 20, top: 16),
                          suffixIcon: InkWell(
                            onTap: () {},
                            child:
                                Image.asset('assets/sendmsg.png', scale: 3.7),
                          ),
                          isDense: true,
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
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: notifire.bordercolor),
                    ),
                    child: Text(
                      Apptext.Predictions,
                      style: TextStyle(
                          color: notifire.greytextcolor,
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Champions League: Liverpool, Tottenham, Chelsea, Man City, Celtic & Rangers state of play fdfgd dfdfdefde',
                maxLines: 3,
                style: TextStyle(
                    color: notifire.greytextcolor,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                leading: CircleAvatar(
                  child: Image.asset(
                    'assets/Ellipse 38.png',
                    scale: 1.5,
                  ),
                ),
                title: Text(
                  'Lewis Jones',
                  style: TextStyle(
                      color: notifire.textcolor,
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  'Sky Sports',
                  style: TextStyle(
                      color: notifire.greytextcolor,
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
                trailing: Text(
                  '30 min ago',
                  style: TextStyle(
                      color: notifire.greytextcolor,
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                //padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(
                  'assets/news1.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Champions League: Liverpool, Tottenham, Chelsea, Man City, Celtic & Rangers state of play fdfgd dfdfdefde, Champions League: Liverpool, Tottenham, Chelsea, Man City, Celtic & Rangers state of play fdfgd dfdfdefde',
                maxLines: 6,
                style: TextStyle(
                    color: notifire.textcolor,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Champions League: Liverpool, Tottenham, Chelsea, Man City, Celtic & Rangers state of play fdfgd dfdfdefde, Champions League: Liverpool, Tottenham, Chelsea, Man City, Celtic & Rangers state of play fdfgd dfdfdefde',
                maxLines: 4,
                style: TextStyle(
                    color: notifire.textcolor,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Champions League: Liverpool, Tottenham, Chelsea, Man City, Celtic & Rangers state of play fdfgd dfdfdefde, Champions League: Liverpool, Tottenham, Chelsea, Man City, Celtic & Rangers state of play fdfgd dfdfdefde',
                maxLines: 4,
                style: TextStyle(
                    color: notifire.textcolor,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
