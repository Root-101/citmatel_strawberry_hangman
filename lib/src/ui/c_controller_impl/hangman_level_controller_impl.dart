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
  bool showTutorial(int levelId, int subLevelid) {
    if (levelId == findAll()[0].id &&
        subLevelid == findAll()[0].sublevel[0].id) {
      return true;
    }
    return false;
  }
}
