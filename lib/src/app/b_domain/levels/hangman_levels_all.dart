import 'package:citmatel_strawberry_hangman/src/app/b_domain/hangman_domain_exporter.dart';
import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';

class HangManLevelsAll {
  static final List<HangManLevelDomain> levels = [
    HangManLevelTutorial.tutorial,
    HangManLevelConocimientoGeneral.levelConocimientoGeneral,
    HangManLevelCienciasNaturales.levelCienciasNaturales,
    HangManLevelTecnologias.levelTecnologias,
    HangManLevelTecnologias.levelTecnologias..id = 4,
    HangManLevelTecnologias.levelTecnologias..id = 5,
    HangManLevelTecnologias.levelTecnologias..id = 6,
    HangManLevelTecnologias.levelTecnologias..id = 7,
    HangManLevelTecnologias.levelTecnologias..id = 8,
    HangManLevelTecnologias.levelTecnologias..id = 9,
    HangManLevelTecnologias.levelTecnologias..id = 10,
  ];
}
