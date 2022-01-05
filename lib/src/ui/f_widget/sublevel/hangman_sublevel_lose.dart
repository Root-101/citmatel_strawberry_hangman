import 'package:animated_background/animated_background.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class HangManSubLevelLose extends StatefulWidget {
  static const ROUTE_NAME = "/hangman-sublevel-loose-level-screen";

  const HangManSubLevelLose({Key? key}) : super(key: key);

  @override
  State<HangManSubLevelLose> createState() => _HangManSubLevelWinState();
}

class _HangManSubLevelWinState extends State<HangManSubLevelLose>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
          options: ParticleOptions(
            baseColor: Colors.blueAccent,
            image: Image.asset("assets/icons/baby_girl.png"),
          ),
        ),
        vsync: this,
        child: AnimatedBackground(
          behaviour: RandomParticleBehaviour(
            options: ParticleOptions(
              baseColor: Colors.red,
              image: Image.asset("assets/icons/baby_boy.png"),
            ),
          ),
          vsync: this,
          child: Container(
            alignment: Alignment.center,
            child: SizedBox(
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Agne',
                  color: Colors.blueAccent
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Has perdido.'),
                    TypewriterAnimatedText('Inténtalo de nuevo.'),
                    TypewriterAnimatedText('El que persevera triunfa.'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
