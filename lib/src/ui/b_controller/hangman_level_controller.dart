import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HangManLevelController extends GetxController {
  List<HangManLevelDomain> findAll();

  HangManLevelDomain findBy(int keyId);

  int count();

  //devuelve la cantidad de estrellas maximo del nivel
  int maxStars(HangManLevelDomain levelDomain);

  //devuelve la cantidad de estrellas ganadas del nivel
  int winedStars(HangManLevelDomain levelDomain);

  Widget randomSubLevel();

  Widget randomSubLevelOf(HangManLevelDomain level);
}
