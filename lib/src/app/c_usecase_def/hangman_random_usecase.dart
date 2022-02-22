import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:clean_core/clean_core.dart';
import 'package:tuple/tuple.dart';

abstract class HangManRandomUseCase extends AbstractUseCase {
  HangManLevelDomain randomLevel();

  Tuple2<HangManSubLevelDomain, HangManSubLevelProgressDomain> randomSubLevel();

  Tuple2<HangManSubLevelDomain, HangManSubLevelProgressDomain> randomSubLevelOf(
      HangManLevelDomain level);
}
