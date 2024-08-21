// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables

import 'package:goscore/signup.dart';
import 'package:goscore/stringfile.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'media.dart';

class onboarding extends StatefulWidget {
  const onboarding({Key? key}) : super(key: key);

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
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
  void initState() {
    super.initState();
    _currentPage = 0;
    _slides = [
      Slide("assets/iPhone13.png", Apptext.heading1, Apptext.subtext1,
          "assets/Score.png"),
      Slide("assets/iPhone14.png", Apptext.heading2, Apptext.subtext2,
          "assets/Card.png"),
      Slide("assets/iPhone15.png", Apptext.heading3, Apptext.subtext3,
          "assets/Content.png"),
    ];
    _pageController = PageController(initialPage: _currentPage);
    super.initState();
  }

  int _currentPage = 0;
  List<Slide> _slides = [];
  PageController _pageController = PageController();

  // the list which contain the build slides
  List<Widget> _buildSlides() {
    return _slides.map(_buildSlide).toList();
  }

  Widget _buildSlide(Slide slide) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.onboardingcolor2,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: height / 7.5,
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  slide.image1,
                  fit: BoxFit.fill,
                  scale: 3.3,
                ),
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 10,
            child: Container(
              height: height / 4,
              width: width / 1.5,
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage(slide.image2),
                ),
              ),
            ),
          ),

          ///bottomofonboarding
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height * 0.40,
              width: double.infinity,
              color: notifire.onboardingcolor1,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                    Text(
                      slide.heading,
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: notifire.textcolor),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.80,
                      child: Text(
                        slide.subtext,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: notifire.greytextcolor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // handling the on page changed
  void _handlingOnPageChanged(int page) {
    setState(() => _currentPage = page);
  }

  // building page indicator
  Widget _buildPageIndicator() {
    Row row = Row(mainAxisAlignment: MainAxisAlignment.center, children: []);
    for (int i = 0; i < _slides.length; i++) {
      row.children.add(_buildPageIndicatorItem(i));
      if (i != _slides.length - 1)
        // ignore: curly_braces_in_flow_control_structures
        row.children.add(const SizedBox(
          width: 10,
        ));
    }
    return row;
  }

  Widget _buildPageIndicatorItem(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: index == _currentPage ? 16 : 8,
      height: index == _currentPage ? 8 : 8,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(100),
        color: index == _currentPage
            ? const Color(0xff0038D9)
            : notifire.onboardindicatorcolor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: _handlingOnPageChanged,
            physics: const BouncingScrollPhysics(),
            children: _buildSlides(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: <Widget>[
                _buildPageIndicator(),
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.025, //indicator set screen
                ),
                _currentPage == 2
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const signup(),
                              ),
                            );
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xff0038D9),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              height: 50,
                              width: 138,
                              child: const Center(
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontFamily: "Poppins"),
                                ),
                              )),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GestureDetector(
                          onTap: () {
                            _pageController.nextPage(
                                duration: const Duration(microseconds: 1),
                                curve: Curves.easeIn);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xff0038D9),
                                borderRadius: BorderRadius.circular(20)),
                            height: 50,
                            width: 138,
                            child: const Center(
                              child: Text(
                                "Next",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontFamily: "Poppins"),
                              ),
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.012, //indicator set screen
                ),
                const SizedBox(height: 20)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Slide {
  String image1;
  String heading;
  String subtext;
  String image2;

  Slide(this.image1, this.heading, this.subtext, this.image2);
}
