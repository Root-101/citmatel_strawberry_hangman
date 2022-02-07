import 'dart:ui';

import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';

class HangManLevelCienciasNaturales {
  static final HangManLevelDomain levelCienciasNaturales = HangManLevelDomain(
    id: 2,
    theme: "Ciencias Naturales",
    themeBackgroundImage: ToolsThemesBackgroundImage(
      urlImage: ToolsThemesAssets.THEME_CIENCIAS,
      colorStrong: Color(0xff3647db),
      colorLight: Color(0xff3fd4fc).withOpacity(0.5),
    ),
    sublevel: [
      HangManSubLevelDomain(
        id: 1,
        answer: "palma",
        urlImage: HangManAssetsNivelCienciasNaturales.CIENCIA_PALMA,
      ),
      HangManSubLevelDomain(
        id: 2,
        answer: "vacuna",
        urlImage: HangManAssetsNivelCienciasNaturales.CIENCIA_VACUNA,
      ),
    ],
  );
}
