import 'package:flutter/cupertino.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/radio_screen.png"),
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
