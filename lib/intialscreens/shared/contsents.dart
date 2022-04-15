
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

String blogo = "assets/omr/omrassets/logo/blogo.png";

var uId;
var tokenme;
var permission;
var languageSelected;
var OnboardingValue;
var welcome;
var localeGlobal;
var statusConnection;
bool statusConnectionFailde= false;
String?  phone;
var storage = GetStorage();
const Color primaryColor = Color(0xff9676ff);
var errorType;
const String errorPasswordWrong = "[firebase_auth/wrong-password] The password is invalid or the user does not have a password.";
const String errorEmailFormat = "[firebase_auth/invalid-email] The email address is badly formatted.";
const String errorUserNotFound ="[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.";
const String errorNetworkFailed ="[firebase_auth/network-request-failed] A network error (such as timeout, interrupted connection or unreachable host) has occurred.";
const String errorDataEmpty ="[firebase_auth/unknown] Given String is empty or null";
const String errorEmailUsed = "[firebase_auth/email-already-in-use] The email address is already in use by another account.";
const String phoneVerificationExpired = "[firebase_auth/session-expired] The sms code has expired. Please re-send the verification code to try again.";
const String phoneVerificationInvalid = "[firebase_auth/invalid-verification-code] The sms verification code used to create the phone auth credential is invalid. Please resend the verification code sms and be sure use the verification code provided by the user.";
const String phoneVerificationError = "[SmsRetrieverHelper] SMS verification code request failed: unknown status code: 17010 null";


var userid;


class Palette {
  static const MaterialColor kToDark = const MaterialColor(
    0xff9676ff, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xff876ae6 ),//10%
      100: const Color(0xff785ecc),//20%
      200: const Color(0xff6953b3),//30%
      300: const Color(0xff5a4799),//40%
      400: const Color(0xff4b3b80),//50%
      500: const Color(0xff3c2f66),//60%
      600: const Color(0xff2d234c),//70%
      700: const Color(0xff1e1833),//80%
      800: const Color(0xff0f0c19),//90%
      900: const Color(0xff000000),//100%
    },
  );
}

