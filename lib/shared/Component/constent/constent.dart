


import 'dart:io';

import 'package:challenges2022/Modeles/user_model.dart';

const String logoMoroccoNow = "assets/images/morocconow.png";
const String logoTitle = "invest and export";
const String logoGoogle = "assets/images/google.png";
const String logoAppel = "assets/images/apple.png";
const String me = "assets/images/me.jpg";

bool? OnboardingValue;
bool? languageSelected;


const double registerTopPadding = 9;

List? listSearche = [];

String? myImage ;
File test = userModel.file!;
File? test2 ;
String? uId;

const String errorPasswordWrong = "[firebase_auth/wrong-password] The password is invalid or the user does not have a password.";
const String errorEmailFormat = "[firebase_auth/invalid-email] The email address is badly formatted.";
const String errorUserNotFound ="[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.";
const String errorNetworkFailed ="[firebase_auth/network-request-failed] A network error (such as timeout, interrupted connection or unreachable host) has occurred.";
const String errorDataEmpty ="[firebase_auth/unknown] Given String is empty or null";
const String errorEmailUsed = "[firebase_auth/email-already-in-use] The email address is already in use by another account.";
String errorType= "test Error";
const String  imageProfileDefault = "https://firebasestorage.googleapis.com/v0/b/challanges2022.appspot.com/o/users%2F1CCRmEFauLXLSyJlKOQu1mQFdOF2%2Fimage_picker5195758460780683118.jpg?alt=media&token=23a49432-17cd-46f5-bc0a-2e46e360813b";