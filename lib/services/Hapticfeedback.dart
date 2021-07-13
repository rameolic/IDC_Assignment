import 'package:flutter_vibrate/flutter_vibrate.dart';

SmallHapticFeedback(bool validotp)async{
/// Check if the device can vibrate
  bool canVibrate = await Vibrate.canVibrate;
  if(canVibrate) {
    if(validotp){
      ///Vibration duration is a 10 milliseconds single small feedback
      Vibrate.feedback(FeedbackType.success);
    }else{
      ///Vibration duration is a 50 milliseconds single large feedback
      Vibrate.feedback(FeedbackType.error);
    }
  }
}

