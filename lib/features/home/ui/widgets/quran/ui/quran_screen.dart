import 'package:flutter/cupertino.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/quran_screen.png"),
        SafeArea(
          child: Column(
            children: [
              Center(child: Image.asset("assets/images/islami.png")),
            ],
          ),
        )
      ]
    );
  }
}
