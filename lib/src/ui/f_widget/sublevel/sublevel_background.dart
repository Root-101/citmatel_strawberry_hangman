import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:flutter/material.dart';

class SubLevelBackground extends StatefulWidget {
  //TODO: cambiar el nombre ese xds
  final SubLevelDomain subLevelDomain;

  const SubLevelBackground({required this.subLevelDomain, Key? key})
      : super(key: key);

  @override
  _SubLevelBackgroundState createState() => _SubLevelBackgroundState();
}

class _SubLevelBackgroundState extends State<SubLevelBackground> {
  late Widget _animatedWidget;

  @override
  void initState() {
    super.initState();
    setState(
      () {
        _animatedWidget = SubLevelLoading(
          onEnd: () {
            //really start the level
            setState(() {
              _animatedWidget =
                  SubLevelScreen(subLevelDomain: widget.subLevelDomain);
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.transparent, //pa si por si acaso
        image: new DecorationImage(
          //TODO: @Aidyl98 genial el uso de la imagen de fondo en el container, asi nos quitamos usar el stack para background de imagen, GENIAL!!!!
          image: new AssetImage("assets/icons/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          /*return RotationTransition(//TODO: @Aidyl98 elige que transición te gusta mas
            turns: animation,
            child: child,
          );*/
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
