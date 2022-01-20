import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:flutter/material.dart';

class HangManSubLevelLoading extends StatelessWidget {
  final HangManSubLevelDomain subLevelDomain;
  final HangManSubLevelProgressDomain subLevelProgressDomain;

  HangManSubLevelLoading({
    required this.subLevelDomain,
    required this.subLevelProgressDomain,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlainSubLevelLoading(
      backgroundURL: HangManAssets.WALLPAPER,
      loading: _loadingWidget(),
      subLevel: HangManSubLevelScreen(
        subLevelDomain: subLevelDomain,
        subLevelProgressDomain: subLevelProgressDomain,
      ),
    );
  }

  _loadingWidget() {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Cargando nivel"),
          StrawberryLoadingSpinkit.randomLoadingSpinkit(),
          //a random loading every time
        ],
      ),
    );
  }
}
