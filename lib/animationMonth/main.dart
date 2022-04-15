
import 'package:challenges2022/animationMonth/listanimation.dart';
import 'package:flutter/material.dart';

Future<void> main() async {


  runApp( MyApp());
}


class MyApp extends StatelessWidget {

  MyApp ({Key? key, }) : super(key: key);


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
        home:ListAnimation()  //AppTracking(camera:camera ,),// const  WalletAppMain(),//WalletAppMain ListAnimation()  // const AnimationMonth(),
    );
  }
}
