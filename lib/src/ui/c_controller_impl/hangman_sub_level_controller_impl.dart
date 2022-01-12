import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';

class HangManSubLevelControllerImpl extends HangManSubLevelController {
  static const _emptyCharacter = "_";
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

      _doWinLevel();
    }
    update();
  }

  void _breakHeart() {
    remainingLives--;
    _doLooseLevel();
  }

  ///separado en metodos el _doLooseLevel y el _doWinLevel para estandarizar su uso
  ///si se pierde el nivel va para la pantalla de looser, sino no hace nada
  ///se pierde el nivel cuando las vidas llegan a 0
  void _doLooseLevel() {
    if (remainingLives <= 0) {
      StrawberryFunction.looseLevel(
        childFirstText: StrawberryAnimatedTextKit.rotateAnimatedText(texts: [
          'Te has quedado sin vidas.',
          'Inténtalo de nuevo.',
          'El que persevera triunfa.',
        ]),
      );
    }
  }

  ///si se gano el nivel ve para otra pantalla de winner, sino no hace nada
  ///Se gana cuando en la palabra no queda ningun caracter vacio
  ///TODO: modificar cuando se agregue soporte para varias palabras, no puede quedar caracter vacio en ninguna palabra
  void _doWinLevel() {
    if (!answerToBe.contains(_emptyCharacter)) {
      StrawberryFunction.winLevel();
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
}
