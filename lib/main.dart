import 'package:flutter/material.dart';
import 'package:islami/utils/shared_preference.dart';
import 'my_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.initSharedPreference();
  SharedPref.getEnglishList("englishList");
  SharedPref.getArabicList("arabicList");
  SharedPref.getAyaList("ayaList");
  runApp(const MyApp());
}