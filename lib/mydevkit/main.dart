import 'package:challenges2022/mydevkit/mydevkit.dart';
import 'package:challenges2022/walletweb/walletweb.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:camera/camera.dart';


Future<void> main() async {


  runApp( MyApp());
}


class MyApp extends StatelessWidget {

  MyApp ({Key? key }) : super(key: key);


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
        home:ListDevKit()  //AppTracking(camera:camera ,),// const  WalletAppMain(),//WalletAppMain ListAnimation()  // const AnimationMonth(),
    );
  }
}
