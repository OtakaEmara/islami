import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{
  static late SharedPreferences sharedPreference;

  static Future<void> initSharedPreference() async{
    sharedPreference =  await SharedPreferences.getInstance();
  }

  static Future<void> saveString(String key, String value) async{
    await sharedPreference.setString(key, value);
  }

  static Future<void> saveEnglishList(String key, List<String> englishList) async {
    await sharedPreference.setStringList(key, englishList);
  }

  static Future<void> saveArabicList(String key, List<String> arabicList) async {
    await sharedPreference.setStringList(key, arabicList);
  }

  static Future<void> saveAyaList(String key, List<String> ayaList) async {
    await sharedPreference.setStringList(key, ayaList);
  }

  static String? getString(String key) {
    return sharedPreference.getString(key);
  }

  static List<String>? getEnglishList(String key) {
    return sharedPreference.getStringList(key);
  }

  static List<String>? getArabicList(String key) {
    return sharedPreference.getStringList(key);
  }

  static List<String>? getAyaList(String key) {
    return sharedPreference.getStringList(key);
  }

}