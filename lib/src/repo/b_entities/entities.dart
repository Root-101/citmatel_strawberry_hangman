import 'package:clean_core/clean_core.dart';
import 'package:objectbox/objectbox.dart';

@Entity() //flutter pub run build_runner build
class HangManSubLevelProgressEntity extends BasicEntityObject {
  @Id()
  int id;

  int hangmanSubLevelDomainId;

  int hangmanLevelDomainId;

  int contPlayedTimes;

  int stars;

  //default construct, DON'T REMOVE
  HangManSubLevelProgressEntity({
    this.hangmanLevelDomainId = 0,
    this.hangmanSubLevelDomainId = 0,
    this.id = 0,
    this.contPlayedTimes = 0,
    this.stars = 0,
  });

  //the one to use
  HangManSubLevelProgressEntity.build({
    required this.hangmanSubLevelDomainId,
    required this.hangmanLevelDomainId,
    this.id = 0,
    this.contPlayedTimes = 0,
    this.stars = 0,
  });
}
