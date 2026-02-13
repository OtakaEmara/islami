import 'package:flutter/material.dart';
import 'package:islami/utils/shared_preference.dart';
import 'my_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.initSharedPreference();
  bool? onBoarding = SharedPref.getBool("onBoarding") ?? false;
  runApp(MyApp(
    onBoarding: onBoarding,
  ));
}