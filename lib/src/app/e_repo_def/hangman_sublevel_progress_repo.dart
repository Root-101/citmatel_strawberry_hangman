import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';
import 'package:clean_core/clean_core.dart';

abstract class HangManSubLevelProgressRepo
    extends CRUDRepository<HangManSubLevelProgressDomain> {
  List<HangManSubLevelProgressDomain> findByLevelId(int levelId);

  HangManSubLevelProgressDomain? findByAllId(int levelId, int subLevelId);
}
