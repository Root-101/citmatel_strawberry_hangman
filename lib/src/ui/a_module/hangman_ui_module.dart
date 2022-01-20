import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';
import 'package:citmatel_strawberry_hangman/src/ui/hangman_ui_exporter.dart';
import 'package:get/get.dart';

class HangManUIModule {
  static Future init() async {
    await HangManCoreModule.init().then((value) {
      Get.put<HangManLevelController>(
          HangManLevelControllerImpl()); //no depende de nadie

      return value;
    });
  }
}
