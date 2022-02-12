import 'package:citmatel_strawberry_hangman/src/app/b_domain/hangman_domain_exporter.dart';
import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';

class HangManLevelsAll {
  static final List<HangManLevelDomain> levels = [
    HangManLevelTutorial.tutorial,
    HangManLevelGeneral.levelConocimientoGeneral,
    HangManLevelCiencias.levelCiencias,
    HangManLevelTecnologias.levelTecnologias,
    HangManLevelMitologia.levelMitologia,
    HangManLevelTecnologias.levelTecnologias.clone()..id = 5,
    HangManLevelTecnologias.levelTecnologias.clone()..id = 6,
    HangManLevelTecnologias.levelTecnologias.clone()..id = 7,
    HangManLevelTecnologias.levelTecnologias.clone()..id = 8,
    HangManLevelTecnologias.levelTecnologias.clone()..id = 9,
    HangManLevelTecnologias.levelTecnologias.clone()..id = 10,
  ];
}
