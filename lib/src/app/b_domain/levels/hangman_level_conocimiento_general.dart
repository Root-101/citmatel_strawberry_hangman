import 'dart:ui';

import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';

class HangManLevelConocimientoGeneral {
  static final HangManLevelDomain levelConocimientoGeneral = HangManLevelDomain(
    id: 1,
    theme: "Conocimiento General",
    themeBackgroundImage: ToolsThemesBackgroundImage(
      urlImage: ToolsThemesAssets.THEME_CULTURA_GENERAL,
      colorStrong: Color(0xffd4801c),
      colorLight: Color(0xffe1a41b).withOpacity(0.5),
    ),
    sublevel: [
      HangManSubLevelDomain(
        id: 1,
        answer: "examen",
        urlImage: HangManAssetsNivelConocimientoGeneral.C_GENERAL_EXAMEN,
      ),
      HangManSubLevelDomain(
        id: 2,
        answer: "libros",
        urlImage: HangManAssetsNivelConocimientoGeneral.C_GENERAL_LIBROS,
      ),
      HangManSubLevelDomain(
        id: 3,
        answer: "escuela",
        urlImage: HangManAssetsNivelConocimientoGeneral.C_GENERAL_ESCUELA,
      ),
      HangManSubLevelDomain(
        id: 4,
        answer: "notas",
        urlImage: HangManAssetsNivelConocimientoGeneral.C_GENERAL_NOTAS,
      ),
      HangManSubLevelDomain(
        id: 5,
        answer: "escribir",
        urlImage: HangManAssetsNivelConocimientoGeneral.C_GENERAL_ESCRIBIR,
      ),
      HangManSubLevelDomain(
        id: 6,
        answer: "cheque",
        urlImage: HangManAssetsNivelConocimientoGeneral.C_GENERAL_CHEQUE,
      ),
      HangManSubLevelDomain(
        id: 7,
        answer: "dinero",
        urlImage: HangManAssetsNivelConocimientoGeneral.C_GENERAL_DINERO,
      ),
      HangManSubLevelDomain(
        id: 8,
        answer: "diploma",
        urlImage: HangManAssetsNivelConocimientoGeneral.C_GENERAL_DIPLOMA,
      ),
    ],
  );
}
