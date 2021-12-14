import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';
import 'package:get/get.dart';

class HangManCoreModule {
  static void init() {
    Get.put<HangManLevelUseCase>(HangManLevelUseCaseImpl(HangManLevelsAll.levels));
  }
}
