import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:flutter/material.dart';

class HangManSubLevelBackground extends StatefulWidget {
  final HangManSubLevelDomain subLevelDomain;

  const HangManSubLevelBackground({required this.subLevelDomain, Key? key})
      : super(key: key);

  @override
  _HangManSubLevelBackgroundState createState() =>
      _HangManSubLevelBackgroundState();
}

class _HangManSubLevelBackgroundState extends State<HangManSubLevelBackground> {
  late Widget _animatedWidget;

  @override
  void initState() {
    super.initState();
    setState(
      () {
        _animatedWidget = HangManSubLevelLoading(
          onEnd: () {
            //really start the level
            setState(() {
              _animatedWidget =
                  HangManSubLevelScreen(subLevelDomain: widget.subLevelDomain);
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent, //pa si por si acaso
        image: DecorationImage(
          image: AssetImage(HangManAssets.WALLPAPER),
          fit: BoxFit.cover,
        ),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(
            child: child,
            scale: animation,
          );
        },
        child: _animatedWidget,
      ),
    );
  }
}
