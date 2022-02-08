import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:get/get.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class HangManSubLevelControllerImpl extends HangManSubLevelController {
  // An empty character to fill the word when isn't completed yet.
  static const _emptyCharacter = "_";

  // The UseCase.
  late final HangManSubLevelUseCase subLevelUseCase;

  // The word that is going to by fill by the choices of the user. Initially is fill with empty characters.
  late final List<String> answerToBe;

  // The remaining lives after the user lose it. Is initialized with the amount of lives if gets to zero the user lose.
  int remainingLives = 0;

  // It is true as long as the tutorial on the correct letter has not been shown for the first time. Then is false.
  bool isFirstTime = true;

  // The controller for the confetti animation.
  late final ConfettiController confettiController;

  // The amount of columns in the keyboard widget.
  late final int keyboardColumns;

  late int firstCorrectLetter;

  late bool _showTutorial;

  HangManSubLevelControllerImpl({
    required HangManSubLevelDomain subLevelDomain,
    required HangManSubLevelProgressDomain subLevelProgressDomain,
  }) : subLevelUseCase = HangManSubLevelUseCaseImpl(
          subLevelDomain: subLevelDomain,
          subLevelProgressDomain: subLevelProgressDomain,
        ) {
    remainingLives = subLevelUseCase.lives();
    answerToBe = List.generate(answerCantOfLetters, (index) => _emptyCharacter);

    keyboardColumns = _generateKeyboardColumns();

    confettiController = ConfettiController(
      duration: const Duration(milliseconds: 50),
    );

    _showTutorial = subLevelUseCase.showTutorial();
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

  // Show the tutorial if is the first sublevel of the first level.
  bool get showTutorial => _showTutorial;

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
    if (!answerToBe.contains(_emptyCharacter) || remainingLives <= 0) {
      return; //tambien se puede destruir el controller con el super.dispose()
    }

    List<int> possiblesIndex = subLevelUseCase.checkLetter(letter);
    if (possiblesIndex.isEmpty) {
      //no existe esa letra en la palabra
      StrawberryAudio.playAudioWrong();
      StrawberryVibration.vibrate();
      _breakHeart(context, key7);
    } else {
      if (isFirstTime && showTutorial) {
        firstCorrectLetter = possiblesIndex[0];
        isFirstTime = false;
        // Continue the tutorial.
        StrawberryTutorial.showTutorial(
          context: context,
          targets: [
            StrawberryTutorial.addMultipleTarget(
              identify: "Target Answer Right",
              keyTarget: key6,
              shadowColor: Colors.green,
              title: 'Respuesta correcta.',
              description:
                  'Felicidades lo has conseguido. Continúa así para ganar el nivel.',
              shape: ShapeLightFocus.Circle,
              contentImageAlign: ContentAlign.top,
              contentTextAlign: ContentAlign.bottom,
            ),
          ],
          onSkip: () {
            stopTutorial();
          },
        );
      } else {
        firstCorrectLetter = 10000;
      }

      StrawberryAudio.playAudioCorrect();
      StrawberryVibration.vibrate();
      _makeConfetti();
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
        onSkip: () {
          stopTutorial();
        },
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
        leftButtonFunction: () => Get.off(
          HangManSubLevelLoading(
            subLevelDomain: subLevelUseCase.subLevelDomain,
            subLevelProgressDomain: subLevelUseCase.subLevelProgressDomain,
          ),
        ),
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
        leftButtonFunction: () {
          Pair<HangManSubLevelDomain, HangManSubLevelProgressDomain> nextLevel =
              Get.find<HangManLevelController>()
                  .nextLevel(subLevelUseCase.subLevelProgressDomain);
          Get.off(
            HangManSubLevelLoading(
              subLevelDomain: nextLevel.a,
              subLevelProgressDomain: nextLevel.b,
            ),
          );
        },
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

  // Make the confetti animation.
  void _makeConfetti() {
    confettiController.play();
  }

  @override
  String get firstAnswerLetter => subLevelUseCase.firstAnswerLetter;

  @override
  void stopTutorial() {
    _showTutorial = false;
  }

  String subLevelTheme() => subLevelUseCase.subLevelTheme();

  int subLevelNumber() => subLevelUseCase.subLevelNumber();
}
