import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{
  static late SharedPreferences sharedPreference;

  static Future<void> initSharedPreference() async{
    sharedPreference =  await SharedPreferences.getInstance();
  }

  static Future<void> saveBool(String key, bool value) async{
    await sharedPreference.setBool(key, value);
  }

  static Future<void> saveInt(String key, int value) async{
    await sharedPreference.setInt(key, value);
  }

  static int? getInt(String key) {
    return sharedPreference.getInt(key);
  }

  static bool? getBool(String key) {
    return sharedPreference.getBool(key);
  }

}