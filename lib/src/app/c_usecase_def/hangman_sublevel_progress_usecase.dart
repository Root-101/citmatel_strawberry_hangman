import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';
import 'package:clean_core/clean_core.dart';

abstract class HangManSubLevelProgressUseCase
    extends CRUDUseCase<HangManSubLevelProgressDomain> {
  List<HangManSubLevelProgressDomain> findByLevel(HangManLevelDomain level);

  List<HangManSubLevelProgressDomain> findByLevelId(int levelId);

  HangManSubLevelProgressDomain findByAll(
      HangManLevelDomain level, HangManSubLevelDomain subLevel);

  HangManSubLevelProgressDomain findByAllId(int levelId, int subLevelId);
}
