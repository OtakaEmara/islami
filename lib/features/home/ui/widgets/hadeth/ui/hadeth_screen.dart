import 'package:flutter/material.dart';

class HadethScreen extends StatelessWidget {
  const HadethScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Image.asset("assets/images/hadeth_screen.png"),
          SafeArea(
              child: Column(
                children: [
                  Center(child: Image.asset("assets/images/islami.png"))
                ],
              )
          )
        ]
    );
  }
}
