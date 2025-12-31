import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: AppColors.black
      ),
      themeMode: ThemeMode.dark,
    );
  }
}
