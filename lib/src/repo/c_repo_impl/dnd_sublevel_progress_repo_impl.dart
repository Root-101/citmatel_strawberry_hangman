import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:clean_core/clean_core.dart';

class HangManSubLevelProgressRepoImpl extends DefaultCRUDRepo<
        HangManSubLevelProgressDomain,
        HangManSubLevelProgressEntity,
        HangManSubLevelProgressRepoExternal>
    implements HangManSubLevelProgressRepo {
  HangManSubLevelProgressRepoExternal _externalRepo;

  HangManSubLevelProgressRepoImpl(
      HangManSubLevelProgressRepoExternal repoExternal)
      : _externalRepo = repoExternal,
        super(
            externalRepo: repoExternal,
            converter: HangManSubLevelProgressConverter.converter);

  @override
  List<HangManSubLevelProgressDomain> findByLevelId(int levelId) {
    //siempre devuelvo la lista aunque esté vacia
    return converter.toDomainAll(
      _externalRepo.findByLevelId(levelId),
    );
  }

  @override
  HangManSubLevelProgressDomain? findByAllId(int levelId, int subLevelId) {
    HangManSubLevelProgressEntity? entity =
        _externalRepo.findByAllId(levelId, subLevelId);
    //si es null, o sea que no existe, devuelve null y que lo procese el UC, si no lo convierto en Domain y devuelvo
    return entity == null
        ? null
        : converter.toDomain(
            entity,
          );
  }
}

class HangManSubLevelProgressConverter extends GeneralConverter<
    HangManSubLevelProgressDomain, HangManSubLevelProgressEntity> {
  static final HangManSubLevelProgressConverter converter =
      HangManSubLevelProgressConverter._();

  HangManSubLevelProgressConverter._();

  @override
  HangManSubLevelProgressDomain toDomain(HangManSubLevelProgressEntity entity) {
    return HangManSubLevelProgressDomain(
      id: entity.id,
      hangmanLevelDomainId: entity.hangmanLevelDomainId,
      hangmanSubLevelDomainId: entity.hangmanSubLevelDomainId,
      contPlayedTimes: entity.contPlayedTimes,
      stars: entity.stars,
    );
  }

  @override
  HangManSubLevelProgressEntity toEntity(HangManSubLevelProgressDomain domain) {
    return HangManSubLevelProgressEntity.build(
      id: domain.id,
      hangmanLevelDomainId: domain.hangmanLevelDomainId,
      hangmanSubLevelDomainId: domain.hangmanSubLevelDomainId,
      contPlayedTimes: domain.contPlayedTimes,
      stars: domain.stars,
    );
  }
}
