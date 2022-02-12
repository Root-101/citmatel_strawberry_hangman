import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:get/get.dart';

class HangManLevelTutorial {
  static final HangManLevelDomain tutorial = HangManLevelDomain(
    id: 0,
    theme: ToolsThemesAssets.THEME_TUTORIAL_NAME,
    themeBackgroundImage: ToolsThemesAssets.THEME_TUTORIAL_BACKGROUND,
    sublevel: [
      HangManSubLevelDomain(
        id: 1,
        answer: "Tutorial",
        urlImage: HangManAssetsNivelTutorial.TUTORIAL,
      ),
    ],
  );

  static HangManSubLevelDomain tutorialSubLevel = tutorial.sublevel[0];

  static HangManSubLevelProgressDomain tutorialSubLevelProgress({
    int starsMultiplier = 2,
  }) {
    HangManSubLevelProgressDomain progress =
        Get.find<HangManSubLevelProgressUseCase>().findByAll(
      HangManLevelTutorial.tutorial,
      HangManLevelTutorial.tutorialSubLevel,
    );
    progress..stars = progress.stars ~/ starsMultiplier;
    return progress;
  }
}
