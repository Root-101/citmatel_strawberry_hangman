import 'package:citmatel_strawberry_hangman/src/repo/hangman_repo_exporter.dart';
import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';
import 'package:objectbox/objectbox.dart';

class HangManSubLevelProgressRepoExternalImpl
    extends DefaultObjectBoxCRUDRepositoryExternal<
        HangManSubLevelProgressEntity>
    implements HangManSubLevelProgressRepoExternal {
  HangManSubLevelProgressRepoExternalImpl(Store store) : super(store);

  @override
  HangManSubLevelProgressEntity? findByAllId(int levelId, int subLevelId) {
    //busco el DnDSubLevelProgressEntity que tenga ese domain y ese sublevel
    final query = box
        .query(
          HangManSubLevelProgressEntity_.hangmanLevelDomainId.equals(levelId) &
              HangManSubLevelProgressEntity_.hangmanSubLevelDomainId
                  .equals(subLevelId),
        )
        .build();
    return query.findFirst();
  }

  @override
  List<HangManSubLevelProgressEntity> findByLevelId(int levelId) {
    //busca todos los DnDSubLevelProgressEntity con el level, o sea, el progreso de todos los subniveles
    final query = box
        .query(
            HangManSubLevelProgressEntity_.hangmanLevelDomainId.equals(levelId))
        .build();
    return query.find();
  }
}
