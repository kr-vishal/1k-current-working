import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goscore/includes/snippets/match_detail.dart';
import 'package:goscore/news.dart';
import 'package:goscore/stringfile.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:goscore/models/match.dart';

class MatchList extends StatefulWidget {
  final List<Match> matches;
  const MatchList({super.key, required this.matches});

  @override
  State<MatchList> createState() => _MatchListState();
}

class _MatchListState extends State<MatchList> {
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

    notifire = Provider.of<ColorNotifire>(context, listen: true);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: ListView.builder(
        itemCount: widget.matches.length,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        itemExtent: 108,
        dragStartBehavior: DragStartBehavior.down,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          Match match = widget.matches[index];
          return InkWell(
            onTap: () => Get.to(MatchDetail(match: match)),
            child: Stack(
              alignment: Alignment.center,

              ///watch now align
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.080,
                  margin: const EdgeInsets.symmetric(vertical: 3),
                  child: Card(
                    color: notifire.checkboxlistilecolor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 80,
                              child: Text(
                                widget.matches[index].homeTeam.name,
                                style: TextStyle(
                                    color: notifire.textcolor,
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Image.network(
                              match.homeTeam.icon,
                              scale: 2.5,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.07,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.025,
                          width: MediaQuery.of(context).size.width * 0.1,
                          decoration: BoxDecoration(
                              color: const Color(0xff34C759).withOpacity(0.08),
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            time[index],
                            style: const TextStyle(
                                color: Color(0xff00C566),
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.07,
                        ),
                        Row(
                          children: [
                            Image.network(
                              match.awayTeam.icon,
                              scale: 2.5,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            SizedBox(
                              width: 80,
                              child: Text(
                                match.awayTeam.name,
                                style: TextStyle(
                                    color: notifire.textcolor,
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  //top: 60,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: InkWell(
                      onTap: () {
                        Get.to(const news());
                      },
                      child: Container(
                        height: 44,
                        width: 136,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(48),
                          color: notifire.checkboxlistilecolor,
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 16),
                            Text(
                              'Watch Now',
                              style: TextStyle(
                                  color: notifire.greytextcolor,
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(width: 12),
                            CircleAvatar(
                              maxRadius:
                                  MediaQuery.of(context).size.height * 0.022,
                              backgroundImage:
                                  const AssetImage('assets/watchnow.png'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
