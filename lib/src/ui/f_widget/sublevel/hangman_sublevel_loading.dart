import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HangManSubLevelLoading extends GetView<HangManLevelController> {
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
      firstText: [
        "Tema: ${controller.themeOfGivenLevel(subLevelProgressDomain)}"
      ],
      secondText: ["Nivel: ${subLevelProgressDomain.hangmanSubLevelDomainId}"],
      subLevel: HangManSubLevelScreen(
        subLevelDomain: subLevelDomain,
        subLevelProgressDomain: subLevelProgressDomain,
      ),
    );
  }
}
