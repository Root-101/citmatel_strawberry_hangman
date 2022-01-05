import 'package:animated_background/animated_background.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
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
    const colorizeColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 70.0,
      fontFamily: 'Horizon',
    );
    return Scaffold(
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
          options: ParticleOptions(
            baseColor: Colors.blueAccent,
          ),
        ),
        vsync: this,
        child: AnimatedBackground(
          behaviour: RandomParticleBehaviour(
            options: ParticleOptions(
              baseColor: Colors.red,
            ),
          ),
          vsync: this,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      ColorizeAnimatedText(
                        'Felicidades',
                        textStyle: colorizeTextStyle,
                        colors: colorizeColors,
                      ),
                    ],
                    repeatForever: true,
                  ),
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 50.0,
                    color: Colors.blueAccent,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText('Has Ganado'),
                      RotateAnimatedText('Lo Lograste'),
                      RotateAnimatedText('Eres el Mejor'),
                    ],
                    repeatForever: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
