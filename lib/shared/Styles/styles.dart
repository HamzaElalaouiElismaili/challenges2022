import 'package:flutter/material.dart';

final ButtonStyle onBoardingButtonStyle = ElevatedButton.styleFrom(
  primary: Colors.indigoAccent,
  onPrimary: Colors.white,
);

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