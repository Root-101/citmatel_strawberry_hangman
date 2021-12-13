import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';

class Level1 {
  static final LevelDomain level1 = LevelDomain(
    id: 1,
    theme: "Tutorial",
    urlThemePicture: "",
    sublevel: [
      SubLevelDomain(
        id: 1,
        answer: "Hello world",
        urlImage: "url",
      ),
      SubLevelDomain(
        id: 2,
        answer: "Hello world2",
        urlImage: "url2",
      ),
      SubLevelDomain(
        id: 3,
        answer: "Hello world3",
        urlImage: "url3",
      ),
    ],
  );
}
