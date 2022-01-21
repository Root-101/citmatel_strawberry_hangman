import 'package:citmatel_strawberry_hangman/src/repo/hangman_repo_exporter.dart';
import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';

abstract class HangManSubLevelProgressRepoExternal
    extends ObjectBoxCRUDRepositoryExternal<HangManSubLevelProgressEntity> {
  List<HangManSubLevelProgressEntity> findByLevelId(int levelId);

  HangManSubLevelProgressEntity? findByAllId(int levelId, int subLevelId);
}
