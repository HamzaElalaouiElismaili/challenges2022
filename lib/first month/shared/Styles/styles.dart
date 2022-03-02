import 'package:flutter/material.dart';



// this  styles for the 1 page => language
final BoxDecoration unselectedLang = BoxDecoration(
  color: Colors.white,
  border : Border.all(color: Colors.grey, width: 0.5),
  borderRadius: BorderRadius.circular(15.0),
);
final BoxDecoration selectedLang = BoxDecoration(
  color: Colors.indigoAccent.withOpacity(0.3),
  border : Border.all(color: Colors.indigoAccent, width: 0.5),
  borderRadius: BorderRadius.circular(15.0),
);
final ButtonStyle langChoosingButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
      side: const BorderSide(
        color: Colors.indigoAccent,
        width: 1.0,
      ),
    ),
  ),
  backgroundColor: MaterialStateProperty.all(Colors.white),
  shadowColor: MaterialStateProperty.all(Colors.white),
);



// this  styles for the 2 page => onBoarding
final ButtonStyle onBoardingButtonStyle = ElevatedButton.styleFrom(
  primary: Colors.indigoAccent,
  onPrimary: Colors.white,
);


// this  styles for the 3 page => login
final ButtonStyle loginButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
      side: const BorderSide(
        color: Colors.indigoAccent,
        width: 1.0,
      ),
    ),
  ),
  backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
);
final ButtonStyle loginWithXButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
      side: const BorderSide(
        color: Colors.indigoAccent,
        width: 1.0,
      ),
    ),
  ),
  backgroundColor: MaterialStateProperty.all(Colors.white),
  shadowColor: MaterialStateProperty.all(Colors.indigoAccent),
);


//
final ButtonStyle registerButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
      side: const BorderSide(
        color: Colors.indigoAccent,
        width: 1.0,
      ),
    ),
  ),
  backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
);



final ButtonStyle completeInfoButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
      side: const BorderSide(
        color: Colors.indigoAccent,
        width: 1.0,
      ),
    ),
  ),
  backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
);



final ButtonStyle updateProfileButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
      side: const BorderSide(
        color: Colors.indigoAccent,
        width: 1.0,
      ),
    ),
  ),
  backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
);




final ButtonStyle alertDialogButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2.0),
      side: const BorderSide(
        color: Colors.indigoAccent,
        width: 1.0,
      ),
    ),
  ),
  backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
);
