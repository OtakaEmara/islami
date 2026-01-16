import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_routes.dart';

import 'features/home/ui/home_screen.dart';
import 'features/onboarding/ui/onboarding_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: AppColors.black,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.gold,
          selectionColor: AppColors.gold,
          selectionHandleColor: AppColors.gold,
        ),
      ),
      themeMode: ThemeMode.dark,
      initialRoute: AppRoutes.onBoarding,
      routes: {
        AppRoutes.onBoarding: (context) => const OnBoardingScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
      },
    );
  }
}
