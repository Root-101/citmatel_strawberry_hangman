import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

class HangManSubLevelWin extends StatefulWidget {
  static const ROUTE_NAME = "/hangman-sublevel-win-level-screen";

  const HangManSubLevelWin({Key? key}) : super(key: key);

  @override
  State<HangManSubLevelWin> createState() => _HangManSubLevelWinState();
}

class _HangManSubLevelWinState extends State<HangManSubLevelWin>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
          options: ParticleOptions(
            baseColor: Colors.red,
          ),
        ),
        vsync: this,
        child: Text('You Win!'),
      ),
    );
  }
}
