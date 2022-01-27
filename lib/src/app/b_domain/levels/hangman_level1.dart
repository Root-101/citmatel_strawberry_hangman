import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';

class HangManLevel1 {
  static final HangManLevelDomain level1 = HangManLevelDomain(
    id: 1,
    theme: "Tutorial",
    urlThemePicture: HangManAssets.WALLPAPER,
    sublevel: [
      HangManSubLevelDomain(
        id: 1,
        answer: "Tutorial",
        urlImage: HangManAssets.TUTORIAL,
      ),
    ],
  );
}
