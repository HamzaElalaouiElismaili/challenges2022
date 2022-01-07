


import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_cubit_controller.dart';

class Appcubit extends Cubit<Appstates> {



  Appcubit() : super(Appinitialstate());

  static Appcubit get(context) => BlocProvider.of(context);

  Locale? localeApp = const Locale("fr" ,"");

  void languageChange({Locale? locale})
  {
    if(locale == const Locale("ar",""))
    {
      localeApp = const Locale("ar","");
      emit(LanguageChangedArabic());
    }
    if(locale == const Locale("fr",""))
    {
      localeApp = const Locale("fr","");
      emit(LanguageChangedFrance());

    }



  }







}