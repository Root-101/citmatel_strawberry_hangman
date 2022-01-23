import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';
import 'package:get/get.dart';

abstract class HangManLevelController extends GetxController {
  List<HangManLevelDomain> findAll();

  HangManLevelDomain findBy(int keyId);

  int count();
}
