import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

///below are some defined const files which will be used across the project,
///so instead of importing all files, we can import this one file containing global variables.
const primary_Text_headers = Color(0xFF519ADF);
const Secondary_text_color = Color(0xFF192E54);
var current_page_index = 0;

///created a custom widget where i can use it easily for all other pages in the liquid animation.
///this custom widget had required parameters that are mentioned with @required in below.
///the parameters are not given default variable type because to avoid null safety warning errors.
///all parameters are initialized in the constructor body below.
class BuildLiquidanimationPage extends StatelessWidget {
  BuildLiquidanimationPage(
      {@required this.highlightedtext,
      @required this.emoji,
      @required this.textheader,
      @required this.assetimage,
      @required this.paratext,
      @required this.backgroundcolor,
      @required this.textheadercolor,
      @required this.paratextcolor,
      @required this.assetimagewidth});
  final assetimage;
  final textheader;
  final highlightedtext;
  final emoji;
  final paratext;
  final backgroundcolor;
  final textheadercolor;
  final paratextcolor;
  final assetimagewidth;
  @override

  ///used scaffold as my material app, due it features.
  ///SafeArea is every helpful to keep all our content on screen(not overlapping with notch's or navigation gesture's).
  ///the rest of widgets used are the basic most common widgets to create the UI as per the design given.
  ///fonts that required hexacode are stored in constants file and directly using them by importing that constant file.
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 35),
                child: Image(
                  width: assetimagewidth,
                  image: AssetImage('images/$assetimage.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textheader,
                      style: TextStyle(
                          color: textheadercolor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Text(highlightedtext,
                            style: TextStyle(
                                color: Secondary_text_color,
                                fontSize: 36,
                                fontWeight: FontWeight.bold)),
                        emoji,
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        paratext,
                        style: TextStyle(
                            color: paratextcolor,
                            fontWeight: FontWeight.w200,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///i made it as a custom widget thinking that it would helpful in another screens of the app
/// space left after more login options because instead of creating a new widget it would be great.
/// just to create a small space efficiently using the resources.
class Loginoptions extends StatelessWidget {
  const Loginoptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Openbottomsheet(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("more login options "),
          Icon(
            CupertinoIcons.arrowtriangle_up_circle,
            size: 15,
          )
        ],
      ),
    );
  }
}

///function created to open sheet from the bottom can be called in any of our screens.
Openbottomsheet(context) {
  showGeneralDialog(
    barrierLabel: "Label",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 200),
    context: context,
    pageBuilder: (context, anim1, anim2) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 220,
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
          //margin: EdgeInsets.only(top: 50, left: 15, right: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          ),
          child: Material(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 50,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 4,
                    )),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ///images downloaded from internet for both google and facebook.
                      Image(
                        height: 15,
                        image: AssetImage('images/googlelogo.png'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Continue with Google")
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        height: 15,
                        image: AssetImage('images/fblogo.png'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Continue with Facebook")
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "By selecting one or another you are agreeing to the",
                      style: TextStyle(color: Colors.blue, fontSize: 8),
                    ),

                    ///i created these as a separate widgets coz i hope their will be redirecting link to both terms and privacy.
                    ///we can assign url to the keywords here
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Terms of Services",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 8,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          " & ",
                          style: TextStyle(color: Colors.blue, fontSize: 8),
                        ),
                        Text(
                          "PrivacyPolicy",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 8,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      ///animation to bring the card vertically upwards.
      return SlideTransition(
        position:
            Tween(begin: Offset(0, 0.5), end: Offset(0, 0)).animate(anim1),
        child: child,
      );
    },
  );
}
