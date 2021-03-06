import 'dart:async';

import 'package:challenges2022/first%20month/Localization/choosing_lang_ui.dart';
import 'package:challenges2022/first%20month/Modules/MainPage/mainpage.dart';
import 'package:challenges2022/first%20month/Modules/OnBoarding/onboarding.dart';
import 'package:challenges2022/first%20month/Modules/login_screen/login_screen_ui.dart';
import 'package:challenges2022/first%20month/shared/Component/NavigationWidgets/NavigationWidget.dart';
import 'package:challenges2022/first%20month/shared/Component/constent/constent.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState()
  {
    super.initState();
    startTime();
  }

  startTime() async
  {
    var duration = const Duration(seconds: 3);
    return Timer(duration, startNextScreen);
  }

  startNextScreen()
  {


    if(uId == "null")
    {
      if (languageSelected == false )
      {
        goToReplace(context, const ChoosingLangUI());
      }
      else if (OnboardingValue == false)
      {
        goToReplace(context, const OnBoarding());
      }
      else
      {
        goToReplace(context,  LoginPage());
      }
    }
    if (uId != "null")
    {
      goToReplace(context,  HomeScreen());

    }



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Image.asset(logoMoroccoNow ),
                    ),
                    const Text(logoTitle,textAlign:TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        height: 1
                      ),
                    ),
                  ],
                ),
              ),
              const CircularProgressIndicator(
                strokeWidth: 2.5,
                backgroundColor: Colors.indigo,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
              ),
              const SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}
