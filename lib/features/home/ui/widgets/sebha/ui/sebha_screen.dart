import 'package:flutter/cupertino.dart';

class SebhaScreen extends StatelessWidget {
  const SebhaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/sebha_screen.png"),
        SafeArea(
          child: Column(
            children: [
              Center(child: Image.asset("assets/images/islami.png")),
            ],
          ),
        )
      ],
    );
  }
}
