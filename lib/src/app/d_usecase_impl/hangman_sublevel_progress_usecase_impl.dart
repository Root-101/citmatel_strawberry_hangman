import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:clean_core/clean_core.dart';

class HangManSubLevelProgressUseCaseImpl
    extends DefaultCRUDUseCase<HangManSubLevelProgressDomain>
    implements HangManSubLevelProgressUseCase {
  late HangManSubLevelProgressRepo _repo;

  HangManSubLevelProgressUseCaseImpl(HangManSubLevelProgressRepo repo)
      : _repo = repo,
        super(repo: repo);

  @override
  List<HangManSubLevelProgressDomain> findByLevel(HangManLevelDomain level) =>
      this.findByLevelId(level.id);

  @override
  List<HangManSubLevelProgressDomain> findByLevelId(int levelId) =>
      _repo.findByLevelId(levelId);

  @override
  HangManSubLevelProgressDomain findByAll(
          HangManLevelDomain level, HangManSubLevelDomain subLevel) =>
      this.findByAllId(level.id, subLevel.id);

  @override
  HangManSubLevelProgressDomain findByAllId(int levelId, int subLevelId) {
    print(
        "buscando el sublevel con levelId: '$levelId' y subLevelId: '$subLevelId'");

    HangManSubLevelProgressDomain? domain =
        _repo.findByAllId(levelId, subLevelId);
    // si es null devuelvo uno vacio para mostrarlo sin progreso en el main menu
    // si tiene algo lo devuelvo
    return domain == null
        ? HangManSubLevelProgressDomain(
            hangmanLevelDomainId: levelId,
            hangmanSubLevelDomainId: subLevelId,
          )
        : domain;
  }
}
