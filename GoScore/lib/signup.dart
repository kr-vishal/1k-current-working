// ignore_for_file: camel_case_types
import 'package:goscore/includes/functions.dart';
import 'package:goscore/stringfile.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'followleague.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
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
      //resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 60),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Apptext.signup1,
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      color: notifire.textcolor),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                SizedBox(
                  width: 260,
                  child: Text(
                    Apptext.signup2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: notifire.greytextcolor,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.062,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: notifire.bordercolor),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: InkWell(
                    onTap: () async {
                      googleLoginAndRedirect();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/google.png',
                          scale: 3.8,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          Apptext.signup3,
                          style: TextStyle(
                              color: notifire.textcolor,
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                /* SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.062,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: notifire.bordercolor),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/Apple.png',
                        scale: 3.8,
                        color: notifire.textcolor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        Apptext.signup4,
                        style: TextStyle(
                            color: notifire.textcolor,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ), */
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Stack(
                  children: [
                    Divider(
                      thickness: 1,
                      color: notifire.bordercolor,
                      indent: 16,
                      endIndent: 16,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 150,
                        color: notifire.backgroundallscreencolor,
                        child: Center(
                          child: Text(
                            Apptext.signup5,
                            style: TextStyle(
                                color: notifire.greytextcolor,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
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
                  style: TextStyle(
                      color: notifire.textcolor, fontFamily: 'Poppins'),
                  decoration: InputDecoration(
                    hintText: Apptext.entername,
                    hintStyle: const TextStyle(
                        color: Color(0xffAEAEB2),
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
                      Apptext.email,
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
                  style: TextStyle(
                      color: notifire.textcolor, fontFamily: 'Poppins'),
                  decoration: InputDecoration(
                    hintText: Apptext.enteremail,
                    hintStyle: const TextStyle(
                        color: Color(0xffAEAEB2),
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
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                InkWell(
                  onTap: () {
                    Get.to(const followleague());
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.062,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color(0xff0038D9),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        Apptext.continue1,
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Apptext.alredy,
                      style: TextStyle(
                          color: notifire.greytextcolor,
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    InkWell(
                      onTap: () {
                        navigateScreenNamed("/login", replace: true);
                      },
                      child: const Text(
                        Apptext.login,
                        style: TextStyle(
                            color: Color(0xff0038D9),
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Apptext.signing,
                      style: TextStyle(
                          color: notifire.greytextcolor,
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      Apptext.Terms,
                      style: TextStyle(
                          color: notifire.textcolor,
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Apptext.and,
                      style: TextStyle(
                          color: notifire.greytextcolor,
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      Apptext.condition,
                      style: TextStyle(
                          color: notifire.textcolor,
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
