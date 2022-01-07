import 'package:challenges2022/Modules/MainPage/appcubit.dart';
import 'package:challenges2022/Modules/MainPage/main_cubit_controller.dart';
import 'package:challenges2022/Modules/OnBoarding/onboarding.dart';
import 'package:challenges2022/Network/local.dart';
import 'package:challenges2022/shared/Component/NavigationWidgets/NavigationWidget.dart';
import 'package:challenges2022/shared/Component/choosingLangWidgets/choosinglangWidgets.dart';
import 'package:challenges2022/shared/Styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'choosing_lang_logic.dart';


class ChoosingLangUI extends StatefulWidget {
  const ChoosingLangUI({Key? key}) : super(key: key);

  @override
  State<ChoosingLangUI> createState() => _ChoosingLangUIState();
}

class _ChoosingLangUIState extends State<ChoosingLangUI> {

  @override
  Widget build(BuildContext context)
  {
    return  BlocConsumer<Appcubit,Appstates>(
      listener:(context,state){},
      builder: (context,state)
      {

        return Scaffold(
          body:  Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:
                [
                  SizedBox(height: 100,child: Image.asset("lang/languages.png")),
                  const SizedBox(height: 25,),
                  choosingLang(path: "lang/ar.png",
                    lang: "Arabic",
                    onTap: ()
                    {
                      setState(()
                      {
                        selectedAr = !selectedAr;
                        selectedEn = false;
                        selectedFr = false;
                        checkChoosingLang();
                      });
                    },
                    opacity: opacity,
                    decoration: selectedArDecoration,
                    selectable: selectedAr,

                  ),

                  const SizedBox(height: 5,),

                  choosingLang(path: "lang/france.png", lang: "France" ,
                    onTap: ()
                    {
                      setState(()
                      {
                        selectedAr = false;
                        selectedEn = false;
                        selectedFr = !selectedFr;
                        checkChoosingLang();
                      });
                    },
                    opacity: opacity,
                    decoration: selectedFrDecoration,
                    selectable: selectedFr,
                  ),

                  const SizedBox(height: 5,),

                  choosingLang(path: "lang/en.png", lang: "English" ,
                    onTap: ()
                    {
                      setState(()
                      {
                        selectedAr = false;
                        selectedEn = !selectedEn;
                        selectedFr = false;
                        checkChoosingLang();
                      });
                    },
                    opacity: opacity,
                    decoration: selectedEnDecoration,
                    selectable: selectedEn,
                  ),
                  const SizedBox(height: 30,),
                  if(selectedAr)
                    langChoosingButton(
                        functionPressing: ()
                        {
                          localeApp = "ar";
                          Appcubit.get(context).languageChange( locale:Locale(localeApp!,""));
                          CashLocal.saveData(key: 'locale', value: "ar");
                          CashLocal.saveData(key: 'languageSelected', value: true);

                          goToReplace(context,const OnBoarding());
                        },
                        textButton: 'اختر اللغة',
                        styleButton: langChoosingButtonStyle),
                  if(selectedFr)
                    langChoosingButton(
                        functionPressing: ()
                        {
                          localeApp = "fr";
                          Appcubit.get(context).languageChange( locale: Locale(localeApp!,""));
                          CashLocal.saveData(key: 'locale', value: "fr");
                          CashLocal.saveData(key: 'languageSelected', value: true);

                          goToReplace(context, const OnBoarding());

                        },
                        textButton: 'Choisissez la langue',
                        styleButton: langChoosingButtonStyle),
                  if(selectedEn)
                    langChoosingButton(
                        functionPressing: ()
                        {
                          localeApp = "fr";
                          Appcubit.get(context).languageChange(locale:Locale(localeApp!,""));
                          CashLocal.saveData(key: 'locale', value: "fr");
                          CashLocal.saveData(key: 'languageSelected', value: true);

                          goToReplace(context, const OnBoarding());
                        },
                        textButton: 'choose language',
                        styleButton: langChoosingButtonStyle),
                ],
              ),
            ),
          ),
        );
      });
  }
}

