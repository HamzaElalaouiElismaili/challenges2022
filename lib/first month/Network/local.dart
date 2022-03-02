import 'package:shared_preferences/shared_preferences.dart';

class CashLocal
{
  static SharedPreferences? prefs;
  static init() async => prefs = await SharedPreferences.getInstance();


  static dynamic getData({required String key}) => prefs!.get(key);


  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await prefs!.setString(key, value);
    if (value is int) return await prefs!.setInt(key, value);
    if (value is bool) return await prefs!.setBool(key, value);

    return await prefs!.setDouble(key, value);
  }

  static Future<bool> removeData({required String key}) => CashLocal.prefs!.remove(key);

}