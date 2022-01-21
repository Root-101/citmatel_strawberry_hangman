import 'package:clean_core/clean_core.dart';

class HangManSubLevelProgressDomain
    extends BasicDomainObject<HangManSubLevelProgressDomain> {
  int id;

  final int hangmanSubLevelDomainId;

  final int hangmanLevelDomainId;

  int contPlayedTimes;
  int stars;

  HangManSubLevelProgressDomain({
    required this.hangmanSubLevelDomainId,
    required this.hangmanLevelDomainId,
    this.id = 0,
    this.contPlayedTimes = 0,
    this.stars = 0,
  });
}
