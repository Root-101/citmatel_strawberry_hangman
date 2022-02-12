import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';

class HangManLevelCiencias {
  static final HangManLevelDomain levelCiencias = HangManLevelDomain(
    id: 2,
    theme: ToolsThemesAssets.THEME_CIENCIAS_NAME,
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
      HangManSubLevelDomain(
        id: 3,
        answer: "invierno",
        urlImage: HangManAssetsNivelCienciasNaturales.CIENCIA_INVIERNO,
      ),
      HangManSubLevelDomain(
        id: 4,
        answer: "nubes",
        urlImage: HangManAssetsNivelCienciasNaturales.CIENCIA_NUBES,
      ),
    ],
  );
}
