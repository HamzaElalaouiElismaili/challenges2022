import 'dart:async';
import 'package:challenges2022/intialscreens/View/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import '../../omrmain.dart';
import '../../shared/contsents.dart';
import '../Permission/permissionscreen.dart';
import '../loginscreen/loginscreen.dart';
import '../welcome/welcome.dart';


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
    var duration = const Duration(seconds: 5);
    return Timer(duration, startNextScreen);
  }

  startNextScreen()
  {


    if(userid == 0)
    {
       if (OnboardingValue == false)
      {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> OnBoarding()));
      }
       else
      {
        if(welcome== false)
        {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> WelcomeScreen()));
        }
        else
        {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> LoginScreen()));
        }
      }
    }

    if (userid != 0)
    {

      if (permission == false)
      {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>PermissionsScreen()));
      }
      else{

        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyHomePage(title: " Omar APP",)));

      }
    }



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff9676ff),
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
                      child: Image.asset(blogo,height: 114,width: 90,),
                    ),
                  ],
                ),
              ),
               CircularProgressIndicator(
                strokeWidth: 2.5,
                backgroundColor: Color(0xff9676ff),
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff9676ff)),
              ),
              const SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}