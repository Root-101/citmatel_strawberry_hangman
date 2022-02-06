import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';
import 'package:citmatel_strawberry_hangman/src/ui/hangman_ui_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

class HangManLevelControllerImpl extends HangManLevelController {
  final HangManLevelUseCase levelUseCase = Get.find<HangManLevelUseCase>();

  @override
  List<HangManLevelDomain> findAll() {
    return levelUseCase.findAll();
  }

  @override
  HangManLevelDomain findBy(int keyId) {
    return levelUseCase.findBy(keyId);
  }

  @override
  int count() {
    return levelUseCase.count();
  }

  @override
  int maxStars(HangManLevelDomain levelDomain) {
    return levelDomain.sublevel.length * HangManSubLevelController.MAX_STARS;
  }

  @override
  int winedStars(HangManLevelDomain levelDomain) {
    return Get.find<HangManSubLevelProgressUseCase>()
        .findByLevelId(levelDomain.id)
        .fold(
          0,
          (previousValue, element) => previousValue + element.stars,
        );
  }

  @override
  int maxStarsAll() {
    //recorro todos los niveles, y empezando en 0, voy sumando la cantidad maxima de estrellas de cada nivel
    return levelUseCase.findAll().fold(
      0,
      (previousValue, level) {
        return previousValue + maxStars(level);
      },
    );
  }

  @override
  int winedStarsAll() {
    //recorro todos los niveles, y empezando en 0, voy sumando la cantidad de estrellas ganadas en cada nivel
    return levelUseCase.findAll().fold(
      0,
      (previousValue, level) {
        return previousValue + winedStars(level);
      },
    );
  }

  @override
  Widget randomSubLevel() {
    Tuple2<HangManSubLevelDomain, HangManSubLevelProgressDomain> tuple =
        Get.find<HangManRandomUseCase>().randomSubLevel();
    print(tuple);
    return HangManSubLevelLoading(
      subLevelDomain: tuple.item1,
      subLevelProgressDomain: tuple.item2,
    );
  }

  @override
  Widget randomSubLevelOf(HangManLevelDomain level) {
    Tuple2<HangManSubLevelDomain, HangManSubLevelProgressDomain> tuple =
        Get.find<HangManRandomUseCase>().randomSubLevelOf(level);
    return HangManSubLevelLoading(
      subLevelDomain: tuple.item1,
      subLevelProgressDomain: tuple.item2,
    );
  }
}
