import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Modules/Splash Screen/SplashScreen.dart';

void main()
{
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Challenges 2022',
      theme: ThemeData(
        fontFamily: "Cairo",
        primarySwatch: Colors.orange,
      ),
      home: const SplashScreen(),
    );
  }
}


