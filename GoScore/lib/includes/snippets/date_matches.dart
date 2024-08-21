import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goscore/includes/snippets/match_list.dart';
import 'package:goscore/models/match.dart';
import 'package:goscore/stringfile.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:goscore/todaymatchalldetails.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DateMatches extends StatefulWidget {
  final List<Match> matches;
  const DateMatches({super.key, required this.matches});

  @override
  State<DateMatches> createState() => _DateMatchesState();
}

class _DateMatchesState extends State<DateMatches> {
  final List time = [
    Apptext.time1,
    Apptext.time2,
    Apptext.time3,
    Apptext.time1,
    Apptext.time2,
    Apptext.time3,
    Apptext.time1,
    Apptext.time2,
    Apptext.time3,
    Apptext.time3,
  ];

  bool darkmode = false;

  late ColorNotifire notifire;

  @override
  void initState() {
    super.initState();
    getdarkmodepreviousstate();
  }

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    darkmode = previusstate ?? false;
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: GestureDetector(
            onTap: () {
              Get.to(
                todaymatchalldetails(matches: widget.matches),
              );
            },
            child: Row(
              children: [
                Image.asset(
                  'assets/league1.png',
                  scale: 2.5,
                  color: notifire.textcolor,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                Text(
                  Apptext.today,
                  style: TextStyle(
                      color: notifire.textcolor,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.40,
                ),
                Image.asset(
                  'assets/Vector.png',
                  scale: 2.5,
                  color: notifire.textcolor,
                ),
              ],
            ),
          ),
        ),
        MatchList(matches: widget.matches)
      ],
    );
  }
}
