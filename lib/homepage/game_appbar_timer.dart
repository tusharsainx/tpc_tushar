import 'package:flutter/material.dart';

class GameAppBarTimer extends StatelessWidget {
  const GameAppBarTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "00:30",
      style: TextStyle(color: Colors.white),
    );
  }
}
