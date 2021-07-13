import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idc_assignment/constants.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'loginpage.dart';
import 'Liquidanimationpages.dart';

/// All stateless widgets from liquidanimationpages file are taken in a list type <widget>.
final pages = [
  Page1(),
  Page2(),
  Page3(),
  Page4(),
];

// ignore: non_constant_identifier_names
class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ///liquid swipe was a package from pub.dev directly imported to our project.
          ///on page changed callback state of the page is changing depends on current page index. 
          ///swipe icon color changes with the background, only 2 background color are used one after another,
          /// so if current page index is even then icon will be white(background is blue),
          /// if index is odd then icon will be blue(background is white).
          Builder(
              builder: (context) => LiquidSwipe(
                  enableLoop: false,
                  enableSideReveal: true,
                  onPageChangeCallback: (index) {
                    print(current_page_index);
                    setState(() {
                      current_page_index = index;
                    });
                  },
                  slideIconWidget: Icon(
                    CupertinoIcons.chevron_left_circle,
                    color: current_page_index % 2 == 0
                        ? Colors.white
                        : primary_Text_headers,
                  ),
                  initialPage: current_page_index,
                  pages: pages)),
          
          ///Skip was invisible in last page of liquid animation so when current page = 3 it be sized box(no color or size)
          current_page_index != 3
              ? SafeArea(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                            (Route<dynamic> route) => false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0, right: 50),
                        child: Text(
                          "Skip",
                          style: TextStyle(
                              color: current_page_index % 2 == 1
                                  ? Colors.white
                                  : Colors.grey),
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox(),
          ///SafeArea is used wherever it possible to keep all the content safe of device notch's and status bars.
          ///page indicator have two colors same as swipe icon it will be white when background is blue,
          ///and blue when background is white.
          ///worm effect is basically dot moving to another page animation in page indicators,
          ///aligned to bottom left.
          SafeArea(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40.0, left: 30),
                child: AnimatedSmoothIndicator(
                  activeIndex: current_page_index,
                  count: 4,
                  effect: WormEffect(
                    radius: 10,
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: current_page_index % 2 == 1
                        ? Colors.white
                        : primary_Text_headers,
                  ),
                ),
              ),
            ),
          ),
          ///next button is only visible in final page ie.. 4 and it will be sized box in rest of the pages.
          ///on tap it will tap it will take to login page.
          current_page_index == 3
              ? SafeArea(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                        padding: const EdgeInsets.only(bottom: 40.0, right: 30),
                        child: GestureDetector(
                          onTap: () {
                            ///back is enable after navigated to login page.
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                           ///can uncomment the below lines to disable back once in login page.
                            // Navigator.of(context).pushAndRemoveUntil(
                            //     MaterialPageRoute(
                            //         builder: (context) => LoginPage()),
                            //     (Route<dynamic> route) => false);
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.transparent,
                            ),
                            child: Text(
                              "Next",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
