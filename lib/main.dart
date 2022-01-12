import 'package:challenges2022/Modeles/user_model.dart';
import 'package:challenges2022/shared/Component/constent/constent.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Localization/choosing_lang_logic.dart';
import 'Localization/localization.dart';
import 'Modules/MainPage/appcubit.dart';
import 'Modules/MainPage/main_cubit_controller.dart';
import 'Modules/MainPage/mainpage.dart';
import 'Modules/Splash Screen/SplashScreen.dart';
import 'Network/local.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CashLocal.init();

  if (CashLocal.getData(key: 'onboarding') == null) CashLocal.saveData(key: 'onboarding', value: false);

  if (CashLocal.getData(key: 'languageSelected') == null) CashLocal.saveData(key: 'languageSelected', value: false);

  if (CashLocal.getData(key: 'locale') == null) CashLocal.saveData(key: 'locale', value: "fr");

  if (CashLocal.getData(key: 'uid') == null) CashLocal.saveData(key: 'uid', value: "null");

  uId = CashLocal.getData(key: 'uid');

  if (CashLocal.getData(key: 'myimage') == null)
  {
    CashLocal.saveData(key: 'myimage', value: "");
  }


  myImage = CashLocal.getData(key: 'myimage');

  OnboardingValue = CashLocal.getData(key: 'onboarding');

  languageSelected = CashLocal.getData(key: 'languageSelected');

  localeApp = CashLocal.getData(key: 'locale') ;


  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));



  runApp( MyApp(local: Locale(localeApp!, ""),));
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
          BlocProvider(create: (context)=> Appcubit()..languageChange(locale: local)),
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


UserModel userModel = UserModel();