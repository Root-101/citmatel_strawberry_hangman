import 'package:flutter/material.dart';

class HangManSubLevelLoading extends StatelessWidget {
  static const int DURATION = 3; //loading timeout

  final VoidCallback onEnd;

  HangManSubLevelLoading({Key? key, required this.onEnd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Comenzando el nivel en..."),
        ],
      ),
    );
  }
}
