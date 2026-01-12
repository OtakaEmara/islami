import 'package:flutter/cupertino.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/time_screen.png"),
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
