import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

abstract class HangManSubLevelController extends GetxController {
  static const String TAG = "hangman-sub-level-controller";

  ///la cantidad de estrellas(visualmente) va a estar entre [0,3] inclusive
  static const int MAX_STARS = 3;

  ///La cantidad de estrellas pueden ser decimales al punto medio, o sea:
  ///se puede ganar 1 estrella o 1 y media o 2 o 2 1/2
  ///y para no almacenar 1.5 para estrella y media, se almacena 3 estrellas
  ///en este caso el multiplicador indica los productos de quien son estrellas entero
  ///como por defecto son 2, significa que cada 2 unidades es una estrella entera
  ///por lo tanto la cantidad de estrellas es:
  ///cantidad: 5
  ///enteras: 2 que sale de: 5 / STARS_MULTIPLIER = (int) 2.5. La parte entera de la division
  ///parcial 1 que sale de: 5 % STARS_MULTIPLIER = (int) 1. O la parte decimal de la división anterior
  ///el parcial siembre va a ser 0 o 1, como un booleano si tiene una media estrella
  static const int STARS_MULTIPLIER = 2;

  // The url of the image.
  String get imageUrl;

  // The amount of lives.
  int get lives;

  // Flag para si se termino el nivel no abrir la foto
  bool get endedLevel;

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

  //devuelve el tema del nivel al que pertenece este subnivel
  String subLevelTheme();

  //devuelve el numero del subnivel en los niveles, basicamene el id del subnivel
  int subLevelNumber();

  void initTutorialCoachMark({
    required BuildContext context,
    required List<TargetFocus> targets,
  });
}
