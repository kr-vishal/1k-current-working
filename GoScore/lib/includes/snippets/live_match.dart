import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goscore/includes/snippets/match_detail.dart';
import 'package:goscore/stringfile.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:goscore/models/match.dart';
import 'package:provider/provider.dart';

class LiveMatch extends StatefulWidget {
  final List<Match> matches;
  const LiveMatch({super.key, required this.matches});

  @override
  State<LiveMatch> createState() => _LiveMatchState();
}

class _LiveMatchState extends State<LiveMatch> {
  late ColorNotifire notifire;
  bool darkmode = false;

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
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Row(
            children: [
              Text(
                Apptext.live,
                style: TextStyle(
                    color: notifire.textcolor,
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        widget.matches.isNotEmpty
            ? InkWell(
                onTap: () {
                  Get.to(MatchDetail(match: widget.matches[0]));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Card(
                    elevation: 0,
                    borderOnForeground: true,
                    color: const Color(0xff0038D9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      height: 178,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xff0038D9),
                        image: DecorationImage(
                          image: const AssetImage('assets/Patern.png'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.2), BlendMode.dstATop),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 12),
                          Text(
                            widget.matches[0].stadium.name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          /* Text(
                          'week 10',
                          style: TextStyle(
                              color: notifire.greytextcolor,
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ), */
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 28.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 32,
                                      backgroundColor: Colors.transparent,
                                      child: Image.network(
                                          widget.matches[0].homeTeam.icon),
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                    Text(
                                      widget.matches[0].homeTeam.name,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      'Home',
                                      style: TextStyle(
                                          color: notifire.greytextcolor,
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        // crossAxisAlignment:
                                        //     CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            widget.matches[0].homeTeamScore
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Poppins',
                                                fontSize: 32,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(width: 8),
                                          const Text(
                                            ':',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Poppins',
                                                fontSize: 32,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            widget.matches[0].awayTeamScore
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Poppins',
                                                fontSize: 32,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01),
                                      Container(
                                        alignment: Alignment.center,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.028,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.12,
                                        decoration: BoxDecoration(
                                            color: const Color(0xff34C759)
                                                .withOpacity(0.08),
                                            border: Border.all(
                                                color: const Color(0xff00C566)),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: const Text(
                                          '90+4',
                                          style: TextStyle(
                                              color: Color(0xff00C566),
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 32,
                                      backgroundColor: Colors.transparent,
                                      child: Image.network(
                                          widget.matches[0].awayTeam.icon),
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                    Text(
                                      widget.matches[0].awayTeam.name,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      'Away',
                                      style: TextStyle(
                                          color: notifire.greytextcolor,
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : const Text("Loading live Matches"),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        )
      ],
    );
  }
}
