import 'package:flutter/material.dart';

final ButtonStyle onBoardingButtonStyle = ElevatedButton.styleFrom(
  primary: Colors.indigoAccent,
  onPrimary: Colors.white,
);

final ButtonStyle loginButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
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
      borderRadius: BorderRadius.circular(30.0),
      side: const BorderSide(
        color: Colors.indigoAccent,
        width: 1.0,
      ),
    ),
  ),
  backgroundColor: MaterialStateProperty.all(Colors.white),
  shadowColor: MaterialStateProperty.all(Colors.indigoAccent),
);

