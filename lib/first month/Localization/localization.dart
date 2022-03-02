import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class  AppLocale {


  Locale? locale ;

  Map<String , String>? _loadedLocalizedValues ;

  AppLocale(this.locale) ;


  static AppLocale of (BuildContext context) => Localizations.of(context, AppLocale) ;


  Future loadLang() async {
    String  _langFile = await rootBundle.loadString('lang/${locale?.languageCode}.json') ;
    Map<String ,dynamic> _loadedValues = jsonDecode(_langFile);
    _loadedLocalizedValues = _loadedValues.map((key, value) => MapEntry(key, value.toString())) ;
  }

  String? getTranslated (String key) {
    return _loadedLocalizedValues![key] ;
  }

  static const LocalizationsDelegate<AppLocale> delegate  = _AppLocalDelegate() ;

}


class  _AppLocalDelegate extends LocalizationsDelegate<AppLocale> {
  const _AppLocalDelegate() ;
  @override
  bool isSupported(Locale locale) {
    return ["fr" , "ar"].contains(locale.languageCode) ;
  }

  @override
  Future<AppLocale> load(Locale locale) async {
    AppLocale appLocale = AppLocale(locale) ;
    await appLocale.loadLang();
    return appLocale ;
  }

  @override
  bool shouldReload(_AppLocalDelegate  old) => false  ;

}


getLang(BuildContext context  , String key) => AppLocale.of(context).getTranslated(key) ;
