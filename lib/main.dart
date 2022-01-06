import 'package:challenges2022/shared/Component/constent/constent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Modules/Splash Screen/SplashScreen.dart';
import 'Network/local.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await CashLocal.init();


  if (CashLocal.getData(key: 'onboarding') == null) CashLocal.saveData(key: 'onboarding', value: false);
  OnboardingValue = CashLocal.getData(key: 'onboarding');

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
        primarySwatch: Colors.indigo,
      ),
      home: const SplashScreen(),
    );
  }
}


