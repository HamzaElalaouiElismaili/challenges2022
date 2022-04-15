

// Pour Monsieur Mohammed HAMEID


// Chat App
//    =====>   lib/first month/main_chat_app/main_chat_app.dart
//    login : hamzaelalaouielismaili@gmail.com
//    password : 123456789


//
// MY Tools Kit
//  =====>  lib/mydevkit/main.dart


// Booking App
//    =====>   lib/second_month/main.dart


// My initials Screens
//   =====>    lib/intialscreens/omrmain.dart


// Google Map with and Take Pictures and Storing on FireStorage
//   =====>   lib/interviewapp/main.dart


// Animation Month
//   =====>  lib/animationMonth/main.dart



// Flutter Web
//   =====>  lib/walletweb/walletweb.dart



import 'package:challenges2022/walletweb/walletweb.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'interviewapp/controllerapp.dart';

import 'package:camera/camera.dart';


Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();
  final firstCamera = cameras.first;
   await Firebase.initializeApp();
  // position = await LocationHelper.getCurrentLocation();

   await Firebase.initializeApp(
     options: const FirebaseOptions(
       apiKey: 'AIzaSyAU1tQEgIWLjLBgnnlb4XKbzeGPQhv5LGE',
       appId: '1:1033213876686:android:f9bbd61c470a846958f39f',
       messagingSenderId: '1033213876686',
       projectId: 'challanges2022',
     ),
   );
     runApp( MyApp(camera: firstCamera,));
}


class MyApp extends StatelessWidget {

   MyApp ({Key? key, required this.camera, }) : super(key: key);
   final CameraDescription camera;

   final registerController = Get.put(AppInterviewController());

   @override
  Widget build(BuildContext context)
  {

     return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Challenges 2022',
      theme: ThemeData(
        fontFamily: "Cairo",
        primarySwatch: Colors.indigo,
      ),
      home:WalletAppMain()  //AppTracking(camera:camera ,),// const  WalletAppMain(),//WalletAppMain ListAnimation()  // const AnimationMonth(),
    );
  }
}



/*
// lib/first month/main_chat_app/main_chat_app.dart
//
// lib/intialscreens/omrmain.dart

import 'package:challenges2022/second_month/bookingstates.dart';
import 'package:challenges2022/second_month/cubitbooking.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'animationMonth/listanimation.dart';
import 'interviewapp/trakingapp.dart';
import 'mydevkit/mydevkit.dart';
import 'mydevkit/screens/ContactUs/contactus1.dart';
import 'package:camera/camera.dart';


Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();
  final firstCamera = cameras.first;
   await Firebase.initializeApp();
   await Firebase.initializeApp(
     options: const FirebaseOptions(
       apiKey: 'AIzaSyAU1tQEgIWLjLBgnnlb4XKbzeGPQhv5LGE',
       appId: '1:1033213876686:android:f9bbd61c470a846958f39f',
       messagingSenderId: '1033213876686',
       projectId: 'challanges2022',
     ),
   );
     runApp( MyApp(camera: firstCamera,));
}


class MyApp extends StatelessWidget {

   MyApp ({Key? key, required this.camera, }) : super(key: key);
   final CameraDescription camera;
  @override
  Widget build(BuildContext context)
  {

    return MultiBlocProvider(
        providers:
        [
          BlocProvider(create: (context)=> BookingAppCubit()),
        ],
        child: BlocConsumer<BookingAppCubit,BookingAppStates>(
            listener: (context,state){},
            builder:(context,state)
            {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Challenges 2022',
                theme: ThemeData(
                  fontFamily: "Cairo",
                  primarySwatch: Colors.indigo,
                ),
                home:  AppTracking(camera:camera ,),// const  WalletAppMain(),//WalletAppMain ListAnimation()  // const AnimationMonth(),
              );
            })
    );
  }
}




 */