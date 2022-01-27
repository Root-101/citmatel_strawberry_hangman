import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';

class HangManLevel2 {
  static final HangManLevelDomain level2 = HangManLevelDomain(
    id: 2,
    theme: "Conocimiento General",
    urlThemePicture: HangManAssets.WALLPAPER,
    sublevel: [
      HangManSubLevelDomain(
        id: 1,
        answer: "conferencia",
        urlImage: HangManAssets.CONFERENCIA,
      ),
      HangManSubLevelDomain(
        id: 2,
        answer: "escuela",
        urlImage: HangManAssets.ESCUELA,
      ),
      HangManSubLevelDomain(
        id: 3,
        answer: "graduacion",
        urlImage: HangManAssets.GRADUACION,
      ),
      HangManSubLevelDomain(
        id: 4,
        answer: "examen",
        urlImage: HangManAssets.EXAMEN,
      ),
      HangManSubLevelDomain(
        id: 5,
        answer: "escribir",
        urlImage: HangManAssets.ESCRIBIR,
      ),
      HangManSubLevelDomain(
        id: 6,
        answer: "laboratorio",
        urlImage: HangManAssets.LABORATORIO,
      ),
      HangManSubLevelDomain(
        id: 7,
        answer: "libros",
        urlImage: HangManAssets.LIBRO,
      ),
      HangManSubLevelDomain(
        id: 8,
        answer: "notas",
        urlImage: HangManAssets.NOTAS,
      ),
    ],
  );
}
