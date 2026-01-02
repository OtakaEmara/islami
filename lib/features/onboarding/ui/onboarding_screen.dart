import 'package:flutter/material.dart';
import 'package:islami/features/onboarding/ui/widgets/page_view_formating.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageViewFormating(),
      )
    );
  }
}