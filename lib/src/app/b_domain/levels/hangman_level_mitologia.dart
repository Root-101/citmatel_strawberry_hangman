import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/assets/assets_exporter.dart';

class HangManLevelMitologia {
  static final HangManLevelDomain levelMitologia = HangManLevelDomain(
    id: 4,
    theme: "Mitología",
    themeBackgroundImage: ToolsThemesAssets.THEME_MITOLOGY_BACKGROUND,
    sublevel: [
      HangManSubLevelDomain(
        id: 1,
        answer: "anubis",
        urlImage: HangManAssetsNivelMitologia.MITOLOGIA_ANUBIS,
      ),
      HangManSubLevelDomain(
        id: 2,
        answer: "ares",
        urlImage: HangManAssetsNivelMitologia.MITOLOGIA_ARES,
      ),
      HangManSubLevelDomain(
        id: 3,
        answer: "artemisa",
        urlImage: HangManAssetsNivelMitologia.MITOLOGIA_ARTEMISA,
      ),
      HangManSubLevelDomain(
        id: 4,
        answer: "deméter",
        urlImage: HangManAssetsNivelMitologia.MITOLOGIA_DEMETER,
      ),
      HangManSubLevelDomain(
        id: 5,
        answer: "faraón",
        urlImage: HangManAssetsNivelMitologia.MITOLOGIA_FARAON,
      ),
      HangManSubLevelDomain(
        id: 6,
        answer: "fauno",
        urlImage: HangManAssetsNivelMitologia.MITOLOGIA_FAUNO,
      ),
      HangManSubLevelDomain(
        id: 7,
        answer: "fénix",
        urlImage: HangManAssetsNivelMitologia.MITOLOGIA_FENIX,
      ),
      HangManSubLevelDomain(
        id: 8,
        answer: "hades",
        urlImage: HangManAssetsNivelMitologia.MITOLOGIA_HADES,
      ),
      HangManSubLevelDomain(
        id: 9,
        answer: "hefesto",
        urlImage: HangManAssetsNivelMitologia.MITOLOGIA_HEFESTO,
      ),
      HangManSubLevelDomain(
        id: 10,
        answer: "poseidón",
        urlImage: HangManAssetsNivelMitologia.MITOLOGIA_POSEIDON,
      ),
      HangManSubLevelDomain(
        id: 11,
        answer: "zeus",
        urlImage: HangManAssetsNivelMitologia.MITOLOGIA_ZEUS,
      ),
    ],
  );
}
