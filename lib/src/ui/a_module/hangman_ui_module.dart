import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';
import 'package:citmatel_strawberry_hangman/src/ui/hangman_ui_exporter.dart';
import 'package:get/get.dart';

class HangManUIModule {
  static void init() {
    HangManCoreModule.init();

    Get.put<LevelController>(LevelControllerImpl());
  }
}
