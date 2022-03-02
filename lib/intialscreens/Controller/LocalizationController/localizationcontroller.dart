import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LocalizationController extends GetxController
{
  void changLanguage({required String localeCode})
  {
    var locale = Locale(localeCode);
    Get.updateLocale(locale);
  }
}
