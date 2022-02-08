import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:get/get.dart';

abstract class HangManLevelController extends GetxController {
  List<HangManLevelDomain> findAll();

  HangManLevelDomain findBy(int keyId);

  int count();

  //devuelve la cantidad de estrellas maximo del nivel
  int maxStars(HangManLevelDomain levelDomain);

  //devuelve la cantidad de estrellas ganadas del nivel
  int winedStars(HangManLevelDomain levelDomain);

  //devuelve la cantidad de estrellas maximo de todos los niveles
  int maxStarsAll();

  //devuelve la cantidad de estrellas ganadas de todos los nivel
  int winedStarsAll();

  //check if all sublevels are completed with at most 1 stars
  bool wonedLevel(HangManLevelDomain levelDomain);

  Widget randomSubLevel();

  Widget randomSubLevelOf(HangManLevelDomain level);

  String themeOfGivenLevel(HangManSubLevelProgressDomain progressDomain);

  Pair<HangManSubLevelDomain, HangManSubLevelProgressDomain> nextLevel(
      HangManSubLevelProgressDomain currentProgress);
}
