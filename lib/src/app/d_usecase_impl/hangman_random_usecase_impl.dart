import 'dart:math';

import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

class HangManRandomUseCaseImpl extends HangManRandomUseCase {
  @override
  HangManLevelDomain randomLevel() {
    HangManLevelUseCase UC = Get.find<HangManLevelUseCase>();
    return UC.findAll()[Random().nextInt(
      UC.count(),
    )];
  }

  @override
  Tuple2<HangManSubLevelDomain, HangManSubLevelProgressDomain>
      randomSubLevel() {
    return randomSubLevelOf(randomLevel());
  }

  @override
  Tuple2<HangManSubLevelDomain, HangManSubLevelProgressDomain> randomSubLevelOf(
      HangManLevelDomain level) {
    HangManSubLevelDomain subLevel =
        level.sublevel[Random().nextInt(level.sublevel.length)];

    HangManSubLevelProgressDomain progress =
        Get.find<HangManSubLevelProgressUseCase>().findByAll(level, subLevel);

    return Tuple2(subLevel, progress);
  }
}
