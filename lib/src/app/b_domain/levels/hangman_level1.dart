import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';

class HangManLevel1 {
  static final HangManSubLevelDomain sublevel = HangManSubLevelDomain(
    id: 1,
    answer: "Hello",
    urlImage: HangManAssets.LEVEL_1_EXAMPLE,
  );
  static final HangManLevelDomain level1 = HangManLevelDomain(
    id: 1,
    theme: "Tutorial",
    urlThemePicture: "",
    sublevel: [
      sublevel.clone()..id = 1,
      sublevel.clone()..id = 2,
      sublevel.clone()..id = 3,
      sublevel.clone()..id = 4,
      sublevel.clone()..id = 5,
    ],
  );
}
