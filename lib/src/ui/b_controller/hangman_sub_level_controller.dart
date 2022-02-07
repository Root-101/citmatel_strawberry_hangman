import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class HangManSubLevelController extends GetxController {
  static const String TAG = "sub-level-controller";

  //la cantidad de estrellas va a estar entre [0,3] inclusive
  static const int MAX_STARS = 3;

  // The url of the image.
  String get imageUrl;

  // The amount of lives.
  int get lives;

  // The remaining lives after the user lose it.
  // Is initialized with the amount of lives if gets to zero the user lose.
  int get remainingLives;

  // The word that is going to by fill by the choices of the user.
  // Initially is fill with empty characters.
  List<String> get answerToBe;

  //cantidad de letras de la respuesta, para saber las columnas del grid view
  int get answerCantOfLetters;

  ///revisa si la letra existe en la respuesta, en ese caso la pone en
  ///los posibles indices, sino rompe un corazón,
  ///y en cualquier caso actualiza la visual
  void checkLetter(
      String letter, BuildContext context, GlobalKey key6, GlobalKey key7);
  // The amount of columns in the keyboard widget.
  int get keyboardColumns;

  List<String> get keyboard;
  // Show the tutorial if is the first sublevel of the first level.
  bool get showTutorial;

  void stopTutorial();

  bool isUsed(String letter);

  bool answerContainLetter(String letter);

  int generateProgress();
  // The controller for the confetti animation.
  ConfettiController get confettiController;

  // Method that returns the first letter of the answer.
  String get firstAnswerLetter;

  int get firstCorrectLetter;
}
