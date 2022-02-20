import 'package:citmatel_strawberry_hangman/src/app/b_domain/hangman_domain_exporter.dart';
import 'package:citmatel_strawberry_hangman/src/app/b_domain/levels/hangman_level_5_deporte.dart';
import 'package:citmatel_strawberry_hangman/src/app/b_domain/levels/hangman_level_6_geografia.dart';
import 'package:citmatel_strawberry_hangman/src/app/b_domain/levels/hangman_level_7_historia.dart';
import 'package:citmatel_strawberry_hangman/src/app/b_domain/levels/hangman_level_8_arte.dart';
import 'package:citmatel_strawberry_hangman/src/app/b_domain/levels/hangman_level_9_animales.dart';
import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';

class HangManLevelsAll {
  static final List<HangManLevelDomain> levels = [
    HangManLevelTutorial.tutorial,
    HangManLevelGeneral.levelConocimientoGeneral,
    HangManLevelCiencias.levelCiencias,
    HangManLevelTecnologias.levelTecnologias,
    HangManLevelMitologia.levelMitologia,
    HangManLevelDeporte.levelDeporte,
    HangManLevelGeografia.levelGeografia,
    HangManLevelHistoria.levelHistoria,
    HangManLevelArte.levelArte,
    HangManLevelAnimales.levelAnimales,
  ];
}
