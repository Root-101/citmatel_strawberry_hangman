import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HangManUIModule {
  static const String MODULE_NAME = "Ahorcado";
  static const Color PRIMARY_COLOR = Colors.blue;
  static const Color SECONDARY_COLOR = Colors.lightBlueAccent;
  static const String URL_MODULE_BACKGROUND = HangManAssets.WALLPAPER;
  static const IconData ICON = Icons.sentiment_very_dissatisfied_outlined;

  static Future init() async {
    await HangManCoreModule.init();

    Get.put<HangManLevelController>(
        HangManLevelControllerImpl()); //no depende de nadie
  }
}
