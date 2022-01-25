import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';
import 'package:citmatel_strawberry_hangman/src/ui/hangman_ui_exporter.dart';
import 'package:get/get.dart';

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
}
