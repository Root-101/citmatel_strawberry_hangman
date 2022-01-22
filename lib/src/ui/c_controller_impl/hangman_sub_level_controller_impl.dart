import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class HangManSubLevelControllerImpl extends HangManSubLevelController {
  static const _emptyCharacter = "_";
  late final HangManSubLevelUseCase subLevelUseCase;
  late final List<String> answerToBe;
  int remainingLives = 0;
  bool isFirstTime = true;
  final bool showTutorial;

  ///cantidad de columnas del teclado
  late final int keyboardColumns;

  HangManSubLevelControllerImpl({
    required HangManSubLevelDomain subLevelDomain,
    required HangManSubLevelProgressDomain subLevelProgressDomain,
    required this.showTutorial,
  }) : subLevelUseCase = HangManSubLevelUseCaseImpl(
          subLevelDomain: subLevelDomain,
          subLevelProgressDomain: subLevelProgressDomain,
        ) {
    remainingLives = subLevelUseCase.lives();
    answerToBe = List.generate(answerCantOfLetters, (index) => _emptyCharacter);

    keyboardColumns = _generateKeyboardColumns();
  }

  @override
  String get imageUrl => subLevelUseCase.subLevelDomain.urlImage;

  @override
  int get lives => subLevelUseCase.subLevelDomain.lives;

  @override
  int get answerCantOfLetters => subLevelUseCase.answerCantOfLetters;

  int _generateKeyboardColumns() {
    return HangManSubLevelUseCaseImpl.DEFAULT_KEYBOARD_COLUMNS;
  }

  @override
  List<String> get keyboard {
    List<String> keyboard = subLevelUseCase.keyboard;
    if (keyboard.length % keyboardColumns != 0) {
      return List.generate(
          subLevelUseCase.keyboardCantLetters, (index) => "Error");
    }
    return keyboard;
  }

  @override
  void checkLetter(
      String letter, BuildContext context, GlobalKey key6, GlobalKey key7) {
    List<int> possiblesIndex = subLevelUseCase.checkLetter(letter);
    if (possiblesIndex.isEmpty) {
      //no existe esa letra en la palabra
      StrawberryAudio.playAudioWrong();
      StrawberryVibration.vibrate();
      _breakHeart(context, key7);
    } else {
      if (isFirstTime && showTutorial) {
        isFirstTime = false;
        // Continue the tutorial.
        StrawberryTutorial.showTutorial(
          context: context,
          targets: [
            StrawberryTutorial.addTarget(
              identify: "Target Answer Right",
              keyTarget: key6,
              shadowColor: Colors.green,
              title: 'Respuesta correcta.',
              description:
                  'Felicidades lo has conseguido. Continúa así para ganar el nivel.',
              shape: ShapeLightFocus.Circle,
              contentAlign: ContentAlign.top,
            ),
          ],
        );
      }

      StrawberryAudio.playAudioCorrect();
      StrawberryVibration.vibrate();
      _fillAnswer(possiblesIndex, letter);

      _doWinLevel();
    }
    update();
  }

  void _breakHeart(BuildContext context, GlobalKey key7) {
    remainingLives--;
    if (lives - remainingLives == 1 && showTutorial) {
      // Continue the tutorial.
      StrawberryTutorial.showTutorial(
        context: context,
        targets: [
          StrawberryTutorial.addTarget(
            identify: "Target Answer Wrong",
            keyTarget: key7,
            shadowColor: Colors.red,
            title: 'Respuesta incorrecta.',
            description: 'Cuando se responde incorrectamente pierdes una vida.'
                '\n Cuando te quedes sin vidas se te dará la posibilidad de intentarlo de nuevo.'
                '\n Solo si completas la palabra correctamente podrás pasar de nivel.',
            shape: ShapeLightFocus.Circle,
            showImageOnTop: false,
            imagePadding: 50,
          ),
        ],
      );
    }
    _doLooseLevel();
  }

  ///separado en metodos el _doLooseLevel y el _doWinLevel para estandarizar su uso
  ///si se pierde el nivel va para la pantalla de looser, sino no hace nada
  ///se pierde el nivel cuando las vidas llegan a 0
  void _doLooseLevel() {
    if (remainingLives <= 0) {
      StrawberryFunction.looseLevel(
        rightButtonFunction: () => Get.back(closeOverlays: true),
        childFirstText: StrawberryAnimatedTextKit.rotateAnimatedText(texts: [
          'Te has quedado sin vidas.',
          'Inténtalo de nuevo.',
          'El que persevera triunfa.',
        ]),
      );
      _doSaveProgress(0);
    }
  }

  ///si se gano el nivel ve para otra pantalla de winner, sino no hace nada
  ///Se gana cuando en la palabra no queda ningun caracter vacio
  ///TODO: modificar cuando se agregue soporte para varias palabras, no puede quedar caracter vacio en ninguna palabra
  void _doWinLevel() {
    if (!answerToBe.contains(_emptyCharacter)) {
      StrawberryFunction.winLevel(
        rightButtonFunction: () => Get.back(closeOverlays: true),
      );
      _doSaveProgress(generateProgress());
    }
  }

  void _fillAnswer(List<int> possiblesIndex, String letter) {
    possiblesIndex.forEach((index) {
      answerToBe[index] = letter;
    });
  }

  @override
  bool isUsed(String letter) => subLevelUseCase.isUsed(letter);

  @override
  bool answerContainLetter(String letter) {
    return subLevelUseCase.answerContainLetter(letter);
  }

  int generateProgress() {
    //TODO corregir a mejor logica
    double progress = (remainingLives / lives) * 100;
    if (progress >= 80) {
      return HangManSubLevelController.MAX_STARS;
    } else if (progress >= 60) {
      return 2;
    } else if (progress >= 20) {
      return 1;
    } else {
      return 0;
    }
  }

  void _doSaveProgress(int stars) {
    //salva el progreso
    subLevelUseCase.saveProgress(stars);

    //actualiza manual la lista del level para que al volver atras ya este actualizado
    Get.find<HangManLevelController>().update();
  }
}
