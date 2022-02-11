import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';

class HangManLevelTecnologias {
  static final HangManLevelDomain levelTecnologias = HangManLevelDomain(
    id: 3,
    theme: "Tecnología",
    themeBackgroundImage: ToolsThemesAssets.THEME_TECNOLOGIA_BACKGROUND,
    sublevel: [
      HangManSubLevelDomain(
        id: 1,
        answer: "cohete",
        urlImage: HangManAssetsNivelTecnologias.TECNOLOGIA_COHETE,
      ),
      HangManSubLevelDomain(
        id: 2,
        answer: "chat",
        urlImage: HangManAssetsNivelTecnologias.TECNOLOGIA_CHAT,
      ),
      HangManSubLevelDomain(
        id: 3,
        answer: "clave",
        urlImage: HangManAssetsNivelTecnologias.TECNOLOGIA_CLAVE,
      ),
      HangManSubLevelDomain(
        id: 4,
        answer: "código",
        urlImage: HangManAssetsNivelTecnologias.TECNOLOGIA_CODIGO,
      ),
      HangManSubLevelDomain(
        id: 5,
        answer: "correo",
        urlImage: HangManAssetsNivelTecnologias.TECNOLOGIA_CORREO,
      ),
      HangManSubLevelDomain(
        id: 6,
        answer: "juego",
        urlImage: HangManAssetsNivelTecnologias.TECNOLOGIA_JUEGO,
      ),
      HangManSubLevelDomain(
        id: 7,
        answer: "laptop",
        urlImage: HangManAssetsNivelTecnologias.TECNOLOGIA_LAPTOP,
      ),
      HangManSubLevelDomain(
        id: 8,
        answer: "video",
        urlImage: HangManAssetsNivelTecnologias.TECNOLOGIA_VIDEO,
      ),
      HangManSubLevelDomain(
        id: 9,
        answer: "virus",
        urlImage: HangManAssetsNivelTecnologias.TECNOLOGIA_VIRUS,
      ),
    ],
  );
}
