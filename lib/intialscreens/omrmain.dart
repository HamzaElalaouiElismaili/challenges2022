import 'package:challenges2022/intialscreens/shared/contsents.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Controller/AppController/appcontroller.dart';
import 'Controller/LocalizationController/localizationcontroller.dart';
import 'Controller/RegisterController/registercontroller.dart';
import 'Model/Localezation/localization.dart';
import 'View/splashscreen/splashs_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  statusConnection = await (Connectivity().checkConnectivity());
  if (statusConnection == ConnectivityResult.mobile)
  {
    // I am connected to a mobile network.
    print("Connect via 4G");
  }
  else if (statusConnection == ConnectivityResult.wifi)
  {
    // I am connected to a wifi network.
    print("Connect via wifi");
  }
  else if (statusConnection == ConnectivityResult.none)
  {
    // I am connected to a wifi network.
    statusConnectionFailde = true;
    print(" No Connection");
  }



  if (storage.read("OnboardingValue") == null) storage.write("OnboardingValue", false);

  if (storage.read("permission") == null) storage.write("permission", false);

  if (storage.read("token") == null) storage.write("token", "token");

  if (storage.read("uid") == null) storage.write("uid", "null");

  if (storage.read("languageSelected") == null) storage.write("languageSelected", false);

  if (storage.read("localeGlobal") == null) storage.write("localeGlobal", "en");

  if (storage.read("welcome") == null) storage.write("welcome", false);

  if (storage.read("userid") == null) storage.write("userid", 0);


  uId = storage.read("uid");
  userid = storage.read("userid");
  tokenme = storage.read("token");
  permission = storage.read("permission");
  languageSelected = storage.read("languageSelected");
  OnboardingValue = storage.read("OnboardingValue");
  welcome = storage.read("welcome");
  localeGlobal = storage.read("localeGlobal");


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final registerController = Get.put(RegisterController());
  final appController = Get.put(AppController());
  final localizationController = Get.put(LocalizationController());


  @override
  Widget build(BuildContext context) {
    print("testing");
    return GetMaterialApp(
      locale: Locale(localeGlobal),
      fallbackLocale: Locale(localeGlobal),
      translations: Localization(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch:Palette.kToDark,
        primaryColor: Color(0xff9676ff),
        fontFamily: "Cairo",
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AppController appController = Get.find();
  LocalizationController localizationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: appController.scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>
          [
             Text("$userid"),
            ElevatedButton(onPressed: ()
            {
              appController.logout();
            }, child: Text("Logout"))
          ],
        ),
      ),

    );
  }
}
