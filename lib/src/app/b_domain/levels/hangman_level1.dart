import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';

class HangManLevel1 {
  static final HangManLevelDomain level1 = HangManLevelDomain(
    id: 1,
    theme: "Tutorial",
    urlThemePicture: "",
    sublevel: [
      HangManSubLevelDomain(
        id: 1,
        answer: "Hello",
        urlImage: HangManAssets.LEVEL_1_EXAMPLE,
      ),
      HangManSubLevelDomain(
        id: 2,
        answer: "Hello world2",
        urlImage: "url2",
      ),
      HangManSubLevelDomain(
        id: 3,
        answer: "Hello world3",
        urlImage: "url3",
      ),
    ],
  );
}
