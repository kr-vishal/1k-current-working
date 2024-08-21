// ignore_for_file: camel_case_types

import 'package:goscore/stringfile.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:goscore/verifycode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class forgotpassword extends StatefulWidget {
  const forgotpassword({Key? key}) : super(key: key);

  @override
  State<forgotpassword> createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
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
        backgroundColor: notifire.backgroundallscreencolor,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios_new,
          color: notifire.textcolor,
        ),
        title: Text(
          Apptext.forgot,
          style: TextStyle(
              color: notifire.textcolor,
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      backgroundColor: notifire.backgroundallscreencolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Apptext.forgot,
                  style: TextStyle(
                      color: notifire.textcolor,
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                SizedBox(
                  width: 250,
                  child: Text(
                    Apptext.sendemail,
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
                  decoration: InputDecoration(
                      labelText: Apptext.email,
                      labelStyle: TextStyle(
                        color: notifire.textcolor,
                        fontFamily: 'Poppins',
                        fontSize: 14,
                      ),
                      hintText: Apptext.enteremail,
                      hintStyle: const TextStyle(
                          color: Color(0xffAEAEB2),
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Image.asset(
                          'assets/Icon1.png',
                          scale: 4,
                          color: notifire.textcolor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: notifire.textcolor),
                        borderRadius: BorderRadius.circular(24),
                      )),
                ),
                Divider(
                  thickness: 1,
                  color: notifire.bordercolor,
                ),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(const verifycode());
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
