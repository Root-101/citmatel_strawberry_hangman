import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HangManSubLevelLoading extends GetView<HangManLevelController> {
  final HangManSubLevelDomain subLevelDomain;
  final HangManSubLevelProgressDomain subLevelProgressDomain;
  final bool mute;

  HangManSubLevelLoading({
    required this.subLevelDomain,
    required this.subLevelProgressDomain,
    required this.mute,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PlainSubLevelLoading(
        firstColor: controller
            .themeLooksOfGivenLevel(subLevelProgressDomain)
            .colorStrong,
        secondColor: controller
            .themeLooksOfGivenLevel(subLevelProgressDomain)
            .colorLight,
        firstText: [
          "Tema: ${controller.themeOfGivenLevel(subLevelProgressDomain)}"
        ],
        secondText: [
          "Nivel: ${subLevelProgressDomain.hangmanSubLevelDomainId}"
        ],
        subLevel: HangManSubLevelScreen(
          mute: mute,
          subLevelDomain: subLevelDomain,
          subLevelProgressDomain: subLevelProgressDomain,
        ),
      ),
    );
  }
}
