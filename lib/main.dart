import 'package:challenges2022/shared/Component/constent/constent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Localization/choosing_lang_logic.dart';
import 'Localization/localization.dart';
import 'Modules/MainPage/appcubit.dart';
import 'Modules/MainPage/main_cubit_controller.dart';
import 'Modules/Splash Screen/SplashScreen.dart';
import 'Network/local.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await CashLocal.init();


  if (CashLocal.getData(key: 'onboarding') == null) CashLocal.saveData(key: 'onboarding', value: false);

  if (CashLocal.getData(key: 'languageSelected') == null) CashLocal.saveData(key: 'languageSelected', value: false);

  if (CashLocal.getData(key: 'locale') == null) CashLocal.saveData(key: 'locale', value: "fr");


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


