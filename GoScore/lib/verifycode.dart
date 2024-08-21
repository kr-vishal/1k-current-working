// ignore_for_file: unnecessary_import, camel_case_types

import 'dart:async';

import 'package:goscore/stringfile.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/otp_field_style.dart';
// import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'followleague.dart';

class verifycode extends StatefulWidget {
  const verifycode({Key? key}) : super(key: key);

  @override
  State<verifycode> createState() => _verifycodeState();
}

class _verifycodeState extends State<verifycode> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  formatedTime(timeinsecond) {
    int sec = timeinsecond % 60;
    // int min = (timeinsecond / 60).floor();
    //String minute = min.toString().length<=1?"0$min":"$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    // ignore: unnecessary_string_interpolations
    return "$second";
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            // isLoading = false;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  // ignore: unused_field
  Timer? _timer;
  int _start = 60;
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
                  Apptext.verify,
                  style: TextStyle(
                      color: notifire.textcolor,
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                RichText(
                  text: TextSpan(
                      text: Apptext.sendcode,
                      style: TextStyle(
                          color: notifire.greytextcolor,
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                            text: Apptext.emailid,
                            style: TextStyle(
                                color: notifire.textcolor,
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w400)),
                      ]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Form(
                    key: _formKey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 58,
                          width: 64,
                          child: TextFormField(
                            style: TextStyle(
                                color: notifire.textcolor,
                                fontFamily: "Poppins"),
                            showCursor: true,
                            cursorColor: notifire.bordercolor,
                            cursorHeight: 2,
                            decoration: InputDecoration(
                                //  hintStyle: TextStyle(color: notifire.getdarkscolor,fontFamily: "gilroy"),
                                //fillColor: const Color(0xffF7F7FB),
                                filled: true,
                                //labelStyle:TextStyle(color: notifire.getgreycolor,fontFamily: "gilroy"),
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: notifire.bordercolor),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: notifire.bordercolor,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(
                                        color: notifire.bordercolor)),
                                focusColor: Colors.cyan),
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 58,
                          width: 64,
                          child: TextFormField(
                            style: TextStyle(
                                color: notifire.textcolor,
                                fontFamily: "Poppins"),
                            showCursor: true,
                            cursorColor: notifire.bordercolor,
                            cursorHeight: 2,
                            decoration: InputDecoration(
                                //  hintStyle: TextStyle(color: notifire.getdarkscolor,fontFamily: "gilroy"),
                                //fillColor: const Color(0xffF7F7FB),
                                filled: true,
                                //labelStyle:TextStyle(color: notifire.getgreycolor,fontFamily: "gilroy"),
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: notifire.bordercolor),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: notifire.bordercolor,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(
                                        color: notifire.bordercolor)),
                                focusColor: Colors.cyan),
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 58,
                          width: 64,
                          child: TextFormField(
                            style: TextStyle(
                                color: notifire.textcolor,
                                fontFamily: "Poppins"),
                            showCursor: true,
                            cursorColor: notifire.bordercolor,
                            cursorHeight: 2,
                            decoration: InputDecoration(
                                //  hintStyle: TextStyle(color: notifire.getdarkscolor,fontFamily: "gilroy"),
                                //fillColor: const Color(0xffF7F7FB),
                                filled: true,
                                //labelStyle:TextStyle(color: notifire.getgreycolor,fontFamily: "gilroy"),
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: notifire.bordercolor),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: notifire.bordercolor,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(
                                        color: notifire.bordercolor)),
                                focusColor: Colors.cyan),
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 58,
                          width: 64,
                          child: TextFormField(
                            style: TextStyle(
                                color: notifire.textcolor,
                                fontFamily: "Poppins"),
                            showCursor: true,
                            cursorColor: notifire.bordercolor,
                            cursorHeight: 2,
                            decoration: InputDecoration(
                                //  hintStyle: TextStyle(color: notifire.getdarkscolor,fontFamily: "gilroy"),
                                //fillColor: const Color(0xffF7F7FB),
                                filled: true,
                                //labelStyle:TextStyle(color: notifire.getgreycolor,fontFamily: "gilroy"),
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: notifire.bordercolor),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: notifire.bordercolor,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(
                                        color: notifire.bordercolor)),
                                focusColor: Colors.cyan),
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 120),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Resend code in',
                      style: TextStyle(
                          color: notifire.greytextcolor,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                          fontSize: 14,
                          fontFamily: 'Poppins'),
                    ),
                    const SizedBox(width: 7),
                    Text(
                      (formatedTime((_start)) + 's'.toString()),
                      style: TextStyle(
                          color: notifire.textcolor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          fontFamily: 'Poppins'),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(const followleague());
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.065,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color(0xff0038D9),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        Apptext.Done,
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
            ),
          ],
        ),
      ),
    );
  }
}
