import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';

class HangManLevelTecnologias {
  static final HangManLevelDomain levelTecnologias = HangManLevelDomain(
    id: 3,
    theme: "Tecnologías",
    themeBackgroundImage: ToolsThemesAssets.THEME_TECNOLOGIA_BACKGROUND,
    sublevel: [
      HangManSubLevelDomain(
        id: 1,
        answer: "cohete",
        urlImage: HangManAssetsNivelTecnologias.TECNOLOGIA_COHETE,
      ),
    ],
  );
}
