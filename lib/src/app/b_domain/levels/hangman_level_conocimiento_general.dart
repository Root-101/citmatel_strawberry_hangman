import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';

class HangManLevelConocimientoGeneral {
  static final HangManLevelDomain levelConocimientoGeneral = HangManLevelDomain(
    id: 1,
    theme: "General",
    themeBackgroundImage: ToolsThemesAssets.THEME_CULTURA_GENERAL_BACKGROUND,
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
      HangManSubLevelDomain(
        id: 9,
        answer: "ajedrés",
        urlImage: HangManAssetsNivelConocimientoGeneral.C_GENERAL_AJEDRES,
      ),
      HangManSubLevelDomain(
        id: 10,
        answer: "almacén",
        urlImage: HangManAssetsNivelConocimientoGeneral.C_GENERAL_ALMACEN,
      ),
      HangManSubLevelDomain(
        id: 11,
        answer: "granja",
        urlImage: HangManAssetsNivelConocimientoGeneral.C_GENERAL_GRANJA,
      ),
      HangManSubLevelDomain(
        id: 12,
        answer: "oficina",
        urlImage: HangManAssetsNivelConocimientoGeneral.C_GENERAL_OFICINA,
      ),
    ],
  );
}
