import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';
import 'package:citmatel_strawberry_hangman/src/ui/hangman_ui_exporter.dart';
import 'package:get/get.dart';

class LevelControllerImpl extends LevelController {
  final LevelUseCase levelUseCase = Get.find<LevelUseCase>();

  @override
  List<LevelDomain> findAll() {
    return levelUseCase.findAll();
  }

  @override
  LevelDomain findBy(int keyId) {
    return levelUseCase.findBy(keyId);
  }

  @override
  int count() {
    return levelUseCase.count();
  }
}
