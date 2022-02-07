import 'dart:ui';

import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';

class HangManLevelTecnologias {
  static final HangManLevelDomain levelTecnologias = HangManLevelDomain(
    id: 3,
    theme: "Tecnologías",
    themeBackgroundImage: ToolsThemesBackgroundImage(
      urlImage: ToolsThemesAssets.THEME_TECNOLOGIA,
      colorStrong: Color(0xff5a73a6),
      colorLight: Color(0xffa9b5d5).withOpacity(0.5),
    ),
    sublevel: [
      HangManSubLevelDomain(
        id: 1,
        answer: "cohete",
        urlImage: HangManAssetsNivelTecnologias.TECNOLOGIA_COHETE,
      ),
    ],
  );
}
