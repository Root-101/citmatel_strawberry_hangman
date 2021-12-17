import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';
import 'package:get/get.dart';

abstract class HangManSubLevelController extends GetxController {
  static const String TAG = "sub-level-controller";

  HangManSubLevelDomain get subLevelDomain;

  String get imageUrl;
  int get lives;
  String get answer;

  List<String> answerSpellOut();
  int answerCantOfWords();
}
