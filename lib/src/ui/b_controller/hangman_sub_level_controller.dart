import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';
import 'package:get/get.dart';

abstract class HangManSubLevelController extends GetxController {
  static const String TAG = "sub-level-controller";

  String get imageUrl;

  int get lives;

  List<String> get answerToBe;

  //cantidad de letras de la respuesta, para saber las columnas del grid view
  int get answerCantOfLetters();

  ///revisa si la letra existe en la respuesta, en ese caso la pone en
  ///los posibles indices, sino rompe un corazón,
  ///y en cualquier caso actualiza la visual
  void checkLetter(String letter);

  int get keyboardColumns;

  List<String> get keyboard;
}
