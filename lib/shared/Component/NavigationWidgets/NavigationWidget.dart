import 'package:flutter/material.dart';

void goTo(BuildContext context, Widget page) => Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));

void goBack(BuildContext context) => Navigator.of(context).pop();

void goBackMaybe(BuildContext context) => Navigator.of(context).maybePop();

void goToReplace(BuildContext context,Widget page) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));