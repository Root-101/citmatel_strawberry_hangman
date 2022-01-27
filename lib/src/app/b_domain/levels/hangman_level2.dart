import 'dart:ui';

import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';

class HangManLevel2 {
  static final HangManLevelDomain level2 = HangManLevelDomain(
    id: 2,
    theme: "Conocimiento General",
    themeBackgroundImage: ToolsThemesBackgroundImage(
      urlImage: ToolsThemesAssets.THEME_CULTURA_GENERAL,
      colorStrong: Color(0xffd4801c),
      colorLight: Color(0xffe1a41b).withOpacity(0.5),
    ),
    sublevel: [
      // HangManSubLevelDomain(
      //   id: 1,
      //   answer: "conferencia",
      //   urlImage: HangManAssets.CONFERENCIA,
      // ),
      HangManSubLevelDomain(
        id: 1,
        answer: "examen",
        urlImage: HangManAssets.EXAMEN,
      ),

      // HangManSubLevelDomain(
      //   id: 3,
      //   answer: "graduacion",
      //   urlImage: HangManAssets.GRADUACION,
      // ),

      // HangManSubLevelDomain(
      //   id: 6,
      //   answer: "laboratorio",
      //   urlImage: HangManAssets.LABORATORIO,
      // ),
      HangManSubLevelDomain(
        id: 2,
        answer: "libros",
        urlImage: HangManAssets.LIBRO,
      ),
      HangManSubLevelDomain(
        id: 3,
        answer: "escuela",
        urlImage: HangManAssets.ESCUELA,
      ),
      HangManSubLevelDomain(
        id: 4,
        answer: "notas",
        urlImage: HangManAssets.NOTAS,
      ),
      HangManSubLevelDomain(
        id: 5,
        answer: "escribir",
        urlImage: HangManAssets.ESCRIBIR,
      ),
    ],
  );
}
