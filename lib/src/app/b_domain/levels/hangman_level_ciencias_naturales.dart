import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';

class HangManLevelCienciasNaturales {
  static final HangManLevelDomain levelCienciasNaturales = HangManLevelDomain(
    id: 2,
    theme: "Ciencias",
    themeBackgroundImage: ToolsThemesAssets.THEME_CIENCIAS_BACKGROUND,
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
