import 'package:citmatel_strawberry_hangman/src/app/b_domain/hangman_domain_exporter.dart';
import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';

class HangManLevelsAll {
  static final List<HangManLevelDomain> levels = [
    HangManLevelTutorial.tutorial,
    HangManLevelConocimientoGeneral.levelConocimientoGeneral,
    HangManLevelCienciasNaturales.levelCienciasNaturales,
    HangManLevelTecnologias.levelTecnologias,
  ];
}
