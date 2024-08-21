// ignore_for_file: camel_case_types

import 'package:goscore/stringfile.dart';
import 'package:goscore/tabbar.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class contactus extends StatefulWidget {
  const contactus({Key? key}) : super(key: key);

  @override
  State<contactus> createState() => _contactusState();
}

class _contactusState extends State<contactus> {
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
          Apptext.contact,
          style: TextStyle(
              color: notifire.textcolor,
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: notifire.backgroundallscreencolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  Apptext.name,
                  style: TextStyle(
                      color: notifire.textcolor,
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            TextField(
              style:
                  TextStyle(color: notifire.textcolor, fontFamily: 'Poppins'),
              decoration: InputDecoration(
                hintText: Apptext.inputname,
                hintStyle: TextStyle(
                    color: notifire.greytextcolor,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: notifire.bordercolor),
                  borderRadius: BorderRadius.circular(24),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: notifire.bordercolor),
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              children: [
                Text(
                  Apptext.EmailAddress,
                  style: TextStyle(
                      color: notifire.textcolor,
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            TextField(
              style:
                  TextStyle(color: notifire.textcolor, fontFamily: 'Poppins'),
              decoration: InputDecoration(
                hintText: Apptext.inputemail,
                hintStyle: TextStyle(
                    color: notifire.greytextcolor,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: notifire.bordercolor),
                  borderRadius: BorderRadius.circular(24),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: notifire.bordercolor),
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Row(
              children: [
                Text(
                  Apptext.feedback,
                  style: TextStyle(
                      color: Color(0xff1C1C1E),
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.14,
              child: TextField(
                maxLines: 5,
                style:
                    TextStyle(color: notifire.textcolor, fontFamily: 'Poppins'),
                decoration: InputDecoration(
                  hintText: Apptext.Leavefeeedback,
                  hintStyle: TextStyle(
                      color: notifire.greytextcolor,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: notifire.bordercolor),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: notifire.bordercolor),
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: notifire.backgroundallscreencolor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: InkWell(
            onTap: () {
              Get.to(const tabbar());
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.065,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xff0038D9),
                  borderRadius: BorderRadius.circular(20)),
              child: const Center(
                child: Text(
                  Apptext.sende,
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
      ),
    );
  }
}
