import 'dart:ui';

import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:get/get.dart';

class HangManLevelTutorial {
  static final HangManLevelDomain tutorial = HangManLevelDomain(
    id: 0,
    theme: "Tutorial",
    themeBackgroundImage: ToolsThemesBackgroundImage(
      urlImage: ToolsThemesAssets.THEME_CULTURA_GENERAL,
      colorStrong: Color(0xffd4801c),
      colorLight: Color(0xffe1a41b).withOpacity(0.5),
    ),
    sublevel: [
      HangManSubLevelDomain(
        id: 1,
        answer: "Tutorial",
        urlImage: HangManAssets.TUTORIAL,
      ),
    ],
  );

  static HangManSubLevelDomain tutorialSubLevel = tutorial.sublevel[0];

  static HangManSubLevelProgressDomain tutorialSubLevelProgress() =>
      Get.find<HangManSubLevelProgressUseCase>().findByAll(
        HangManLevelTutorial.tutorial,
        HangManLevelTutorial.tutorialSubLevel,
      );
}
