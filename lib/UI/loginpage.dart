import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idc_assignment/constants.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'dart:async';
import 'package:idc_assignment/services/Hapticfeedback.dart';


///to avoid null safety a default number.
int mobilenumber = 0000000;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ///to get control over text field number input controller was initialized
  TextEditingController numberinputcontroller = TextEditingController();
  /// required to change the state of the page.
  bool OTPsent = false;
  bool otpverified = false;
  bool otpentered = false;
  bool numberverfied = false;
  bool numberentered = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        /// scroll feature was given to swipe over screen when keyboard from device,
        /// occupies about half of the screen space.
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height/1.1,
              child: Column(
                ///to keep Ui stable sized box's are used for the required space
                ///without sized box when keyboard pops out structure of ui change's.
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0,top: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///To get performance and resource efficient same widget was re used instead of creating a new widget
                        Text(
                          OTPsent ? "Enter Otp" : "Enter your",
                          style: TextStyle(
                              color: primary_Text_headers,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          OTPsent ? "" : "Mobile number",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ///number entered in the text field was passed here
                        Text(
                          OTPsent
                              ? "Please enter the verification code sent to $mobilenumber"
                              : "we will send you a One Time Password(OTP)",
                          style: TextStyle(color: Colors.black45, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  OTPsent
                      ? Center(
                          child: OTPTextField(
                            onChanged: (value) {
                              otpentered = true;
                              if (int.parse(value) == 858585) {
                                print("here");
                                ///small haptic feedback is given to user to notify if OTP is valid
                                SmallHapticFeedback(true);
                                setState(() {
                                  otpverified = true;
                                });
                              } else {
                                print("Incorrect");
                                if(value.length == 6){
                                  ///large haptic feedback is given to user to notify if OTP is invalid
                                  SmallHapticFeedback(false);
                                }
                                setState(() {
                                  otpverified = false;
                                });
                              }
                            },
                            onCompleted: (value) {
                              print(value);
                            },
                            length: 6,
                            width: MediaQuery.of(context).size.width / 2,
                            fieldWidth: 20,
                            style: TextStyle(fontSize: 17),
                            textFieldAlignment: MainAxisAlignment.spaceAround,
                            fieldStyle: FieldStyle.underline,
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0, top: 2.0),
                              child: Text(
                                "+91",
                                style:
                                    TextStyle(color: Colors.black45, fontSize: 20),
                              ),
                            ),
                            SizedBox(
                              width: 120,
                              ///when ever number changed state of UI is changing with respect to the conditions given.
                              ///when number was not 10 digits as per indian mobile number validation,number was not verified amd wise verse.
                              ///if number length was more than 0 and not equal 10 invalid number alert was shown.
                              child: TextFormField(
                                style: TextStyle(color: Colors.grey),
                                controller: numberinputcontroller,
                                onChanged: (value) {
                                  if (numberinputcontroller.text.length != 10) {
                                    setState(() {
                                      numberverfied = false;
                                    });
                                  } else {
                                    ///small haptic feedback is given to user to notify if number is valid
                                    SmallHapticFeedback(true);
                                    setState(() {
                                      numberverfied = true;
                                    });
                                  }
                                  if (numberinputcontroller.text.length < 0) {
                                    setState(() {
                                      numberentered = false;
                                    });
                                  } else {
                                    setState(() {
                                      numberentered = true;
                                    });
                                  }
                                },
                                keyboardType: TextInputType.number,
                                decoration: new InputDecoration(
                                  hintText: "Enter here",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                  ///when otp has length more than 0 alert was show and incorrect until otp entered was 858585.
                  ///colors will change accordingly.
                  otpentered
                      ? Center(
                          child: Container(
                              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(10.0),
                                color: otpverified
                                    ? Colors.green.shade50
                                    : Colors.red.shade50,
                              ),
                              child: Text(
                                otpverified ? "OTP Correct" : "OTP Incorrect",
                                style: TextStyle(
                                  color: otpverified ? Colors.green : Colors.red,
                                ),
                              )),
                        )
                      : SizedBox(),
                  ///when number was not 10 digits as per indian mobile number validation,number was not verified amd wise verse.
                  ///if number length was more than 0 and not equal 10 invalid number alert was shown.
                  ///if number was sucessfully verified then proceed option button pops out or less invaild number.
                  numberentered && !numberverfied
                      ? Center(
                          child: Container(
                              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.red.shade50,
                              ),
                              child: Text(
                                "Please enter a valid mobile number",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              )),
                        )
                  ///on tap timer will be started timer function was written at the end of the code.
                  ///and number entered will be successfully passed.
                      : !OTPsent
                          ? Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: FloatingActionButton(
                                  onPressed: () {
                                    mobilenumber =
                                        int.parse(numberinputcontroller.text);
                                    startTimer();
                                    setState(() {
                                      OTPsent = true;
                                    });
                                  },
                                  backgroundColor: primary_Text_headers,
                                  child: Icon(
                                    Icons.chevron_right,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(),
                  ///resend will otp show until timer ends(30 sec)
                  OTPsent
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: _start != 0
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Resend OTP in ',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        '00.$_start',
                                        style:
                                            TextStyle(color: primary_Text_headers),
                                      ),
                                    ],
                                  )
                                : Center(
                                    child: GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          "Resend OTP",
                                          style: TextStyle(
                                              color: primary_Text_headers),
                                        )),
                                  ),
                          ),
                        )
                      : SizedBox(),
                  ///to be more efficient towards resources use same widget was the motto
                  ///but height and width must be constant so cant map them with same given size to both
                  ///hence 2 separate widgets are used
                  Center(
                    child: OTPsent
                        ? Image(
                            height: MediaQuery.of(context).size.height / 3,
                            image: AssetImage('images/Fingerprint-bro 1.png'),
                          )
                        : Image(
                        height: MediaQuery.of(context).size.height / 3,
                            image: AssetImage('images/Group 841.png'),
                          ),
                  ),
                  SizedBox(height: 20,),
                  ///this function was created in constants file and can be reused any where.
                  Loginoptions()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  /// timer duration was given 30 sec
  /// but calling same function can pause the timer too.
  int _start = 30;
  void startTimer() {
    Timer _timer = new Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }
}
