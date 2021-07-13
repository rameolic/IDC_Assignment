import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:idc_assignment/constants.dart';



///with help of custom widget(BuildLiquidanimationPage) i created in constants file, i created all these files in no time.
///custom widgets are every time efficient.
///all difference's in all pages are given as parameters
///stateless widgets are used for the performance and dont really require stateful widgets here.
///liquidanimation pages has two background colors white and blue,so background as given as parameter
///every page has it now image so images are parameters as assetimage.
///inorder to map every image size in the next page image width parameter is given.
///textheader and paratext color changes with respect to background color so those are given as parameters
///some pages are having asset images and some are displaying only emoji, so emoji parameters are given as <widget> data type.
class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildLiquidanimationPage(
      backgroundcolor: Colors.white,
      assetimage: "Illustration",
      assetimagewidth: MediaQuery.of(context).size.width/1.2,
      textheader: "Explore like a",
      textheadercolor: primary_Text_headers,
      highlightedtext: "Ninja! ",
      emoji: Image(
        width: 30,
        image: AssetImage('images/image 28.png'),
      ),
      paratextcolor: primary_Text_headers,
      paratext: "Take your career to next level\nwith personalized career info\nbased on your interests, skill &\npersonality.",
    );
  }
}


class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildLiquidanimationPage(
      backgroundcolor: primary_Text_headers,
      assetimage: "Group 840",
      assetimagewidth: MediaQuery.of(context).size.width/1.5,
      textheader: "Choose like a",
      highlightedtext: "Pro! ",
      emoji: Text("✅",style: TextStyle(color: Secondary_text_color,fontSize: 25,fontWeight: FontWeight.bold)),
      paratext: "No matter what aspect of\ncollege life you are looking for\nwe provide listing and ranking\nbased on your preferences.",
      textheadercolor: Colors.white,
      paratextcolor: Colors.white,
    );
  }
}


class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildLiquidanimationPage(
      backgroundcolor: Colors.white,
      assetimage: "Group 838",
      assetimagewidth: MediaQuery.of(context).size.width/1.5,
      textheader: "Prepare for the",
      textheadercolor: primary_Text_headers,
      highlightedtext: "Real World! ",
      emoji: Image(
        width: 30,
        image: AssetImage('images/image 30.png'),
      ),
      paratextcolor: primary_Text_headers,
      paratext: "we'll show you exactly what to\ndo to make your dream job a\nreality.",
    );
  }
}


class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BuildLiquidanimationPage(
      backgroundcolor: primary_Text_headers,
      assetimage: "Group 845",
      assetimagewidth: MediaQuery.of(context).size.width/1.5,
      textheader: "How can we",
      highlightedtext: "Help ? ",
      emoji: Text("✅",style: TextStyle(color: Secondary_text_color,fontSize: 25,fontWeight: FontWeight.bold)),
      paratext: "Get ready for your transition\nfrom school to college and\nfinally to a perfect career with\nus!",
      textheadercolor: Colors.white,
      paratextcolor: Colors.white,
    );
  }
}