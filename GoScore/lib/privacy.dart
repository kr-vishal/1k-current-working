// ignore_for_file: camel_case_types

import 'package:goscore/stringfile.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class privacy extends StatefulWidget {
  const privacy({Key? key}) : super(key: key);

  @override
  State<privacy> createState() => _privacyState();
}

class _privacyState extends State<privacy> {
  final ScrollController _firstController = ScrollController();
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
            Apptext.Policies,
            style: TextStyle(
                color: notifire.textcolor,
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        ),
        backgroundColor: notifire.backgroundallscreencolor,
        body: RawScrollbar(
          thumbVisibility: true,
          thumbColor: const Color(0xff0039D8),
          trackColor: const Color(0xff38384C),
          trackVisibility: true,
          controller: _firstController, //always show scrollbar
          thickness: 4, //width of scrollbar
          radius: const Radius.circular(20), //corner radius of scrollbar
          scrollbarOrientation: ScrollbarOrientation.right,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        Apptext.terms,
                        style: TextStyle(
                            color: notifire.textcolor,
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    Apptext.loreamipsum,
                    style: TextStyle(
                        color: notifire.greytextcolor,
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    Apptext.loreamipsum,
                    style: TextStyle(
                        color: notifire.greytextcolor,
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Text(
                        Apptext.Service,
                        style: TextStyle(
                            color: notifire.textcolor,
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    Apptext.loreamipsum,
                    style: TextStyle(
                        color: notifire.greytextcolor,
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    Apptext.loreamipsum,
                    style: TextStyle(
                        color: notifire.greytextcolor,
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    Apptext.loreamipsum,
                    style: TextStyle(
                        color: notifire.greytextcolor,
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
