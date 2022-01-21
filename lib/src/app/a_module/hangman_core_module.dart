import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:get/get.dart';

class HangManCoreModule {
  static Future init() async {
    await HangManRepoModule.init();

    //sin dependencia
    Get.put<HangManLevelUseCase>(
        HangManLevelUseCaseImpl(HangManLevelsAll.levels));

    //el de progreso con la BD
    Get.put<HangManSubLevelProgressUseCase>(
      HangManSubLevelProgressUseCaseImpl(
          HangManRepoModule.subLevelProgressRepo),
    );
  }

  static void dispose() {
    HangManRepoModule.dispose();
    Get.deleteAll(force: true);
  }
}
