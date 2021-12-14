import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';
import 'package:get/get.dart';

abstract class LevelController extends GetxController {
  List<LevelDomain> findAll();

  LevelDomain findBy(int keyId);

  int count();
}
