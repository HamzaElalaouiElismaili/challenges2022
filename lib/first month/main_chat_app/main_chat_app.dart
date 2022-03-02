import 'dart:io';
import 'package:challenges2022/first%20month/Localization/choosing_lang_logic.dart';
import 'package:challenges2022/first%20month/Localization/localization.dart';
import 'package:challenges2022/first%20month/Modeles/user_model.dart';
import 'package:challenges2022/first%20month/Modules/MainPage/appcubit.dart';
import 'package:challenges2022/first%20month/Modules/MainPage/main_cubit_controller.dart';
import 'package:challenges2022/first%20month/Modules/Splash%20Screen/SplashScreen.dart';
import 'package:challenges2022/first%20month/Network/local.dart';
import 'package:challenges2022/first%20month/shared/Component/constent/constent.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';




Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async
{
  await Firebase.initializeApp();
}

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAU1tQEgIWLjLBgnnlb4XKbzeGPQhv5LGE',
      appId: '1:1033213876686:android:f9bbd61c470a846958f39f',
      messagingSenderId: '1033213876686',
      projectId: 'challanges2022',
    ),
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      importance: Importance.high,
      description:'This channel is used for important notifications.',
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }




  await CashLocal.init();

  if (CashLocal.getData(key: 'onboarding') == null) CashLocal.saveData(key: 'onboarding', value: false);

  if (CashLocal.getData(key: 'languageSelected') == null) CashLocal.saveData(key: 'languageSelected', value: false);

  if (CashLocal.getData(key: 'locale') == null) CashLocal.saveData(key: 'locale', value: "fr");

  if (CashLocal.getData(key: 'uid') == null) CashLocal.saveData(key: 'uid', value: "null");

  if (CashLocal.getData(key: 'token') == null) CashLocal.saveData(key: 'token', value: "null");

  uId = CashLocal.getData(key: 'uid');
  tokenme = CashLocal.getData(key: 'token');
  if (CashLocal.getData(key: 'myimage') == null)
  {
    CashLocal.saveData(key: 'myimage', value: "");
  }

  myImage = CashLocal.getData(key: 'myimage');
  userModel.file = File(myImage!);
  OnboardingValue = CashLocal.getData(key: 'onboarding');

  languageSelected = CashLocal.getData(key: 'languageSelected');

  localeApp = CashLocal.getData(key: 'locale') ;

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  BlocOverrides.runZoned(() => runApp( MyApp(local: Locale(localeApp!, ""),)),blocObserver: Blocobserver());
}



class MyApp extends StatelessWidget
{
  final Locale? local ;
  const MyApp({Key? key ,required this.local}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return MultiBlocProvider(
        providers:
        [
          BlocProvider(create: (context)=> Appcubit()..languageChange(locale: local)..getToken()..getMyInfo()..listingToNotification()),
        ],
        child: BlocConsumer<Appcubit,Appstates>(
            listener: (context,state){},
            builder:(context,state)
            {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Challenges 2022',
                theme: ThemeData(
                  fontFamily: "Cairo",
                  primarySwatch: Colors.indigo,
                ),
                // routes: {'/message': (context) => const HomeScreen(),},
                home: const SplashScreen(),
                localizationsDelegates: const [
                  AppLocale.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate
                ],
                locale: Appcubit.get(context).localeApp,
                supportedLocales: const [
                  Locale("fr", ""),
                  Locale("ar", ""),
                ],
                localeResolutionCallback: (currentLang, supportLang) {
                  if (currentLang != null) {
                    for (Locale locale in supportLang) {
                      if (locale.languageCode == currentLang.languageCode) {
                        return currentLang;
                      }
                    }
                  }
                  return supportLang.first;
                },
              );

            })

    );
  }
}




class Blocobserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}