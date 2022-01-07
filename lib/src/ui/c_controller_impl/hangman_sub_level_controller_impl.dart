import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:get/get.dart';

class HangManSubLevelControllerImpl extends HangManSubLevelController {
  late final HangManSubLevelUseCase subLevelUseCase;
  late final List<String> answerToBe;
  int remainingLives = 0;

  ///cantidad de columnas del teclado
  late final int keyboardColumns;

  HangManSubLevelControllerImpl({
    required HangManSubLevelDomain subLevelDomain,
  }) : subLevelUseCase = HangManSubLevelUseCaseImpl(
          subLevelDomain: subLevelDomain,
        ) {
    remainingLives = subLevelUseCase.lives();
    answerToBe = List.generate(answerCantOfLetters, (index) => "_");

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
  void checkLetter(String letter) {
    List<int> possiblesIndex = subLevelUseCase.checkLetter(letter);
    if (possiblesIndex.isEmpty) {
      //no existe esa letra en la palabra
      StrawberryAudio.playAudioWrong();
      StrawberryVibration.vibrate();
      _breakHeart();
    } else {
      StrawberryAudio.playAudioCorrect();
      StrawberryVibration.vibrate();
      _fillAnswer(possiblesIndex, letter);
    }
    update();
  }

  void _breakHeart() {
    remainingLives--;
    if (remainingLives <= 0) {
      _looseLevel();
    }
  }

  void _looseLevel() {
    Get.offNamed(StrawberryLevelLose.ROUTE_NAME);
  }

  void _winLevel() {
    Get.offNamed(StrawberryLevelWin.ROUTE_NAME);
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
}
