import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';

class HangManSubLevelControllerImpl extends HangManSubLevelController {
  late final HangManSubLevelUseCase subLevelUseCase;
  late final List<String> answerToBe;
  int remainingLives = 0;
  final assetsAudioPlayer = AssetsAudioPlayer();

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
      playAudio("assets/audios/keyboard_error.mp3");
      StrawberryVibration.vibrate();
      _breakHeart();
    } else {
      playAudio("assets/audios/keyboard_correct.wav");
      StrawberryVibration.vibrate();
      _fillAnswer(possiblesIndex, letter);
    }
    update();
  }

  void _breakHeart() {
    remainingLives--;
    if (remainingLives <= 0) {
      looseLevel();
    }
  }

  void looseLevel() {}

  void _fillAnswer(List<int> possiblesIndex, String letter) {
    possiblesIndex.forEach((index) {
      answerToBe[index] = letter;
    });
  }

  bool isUsed(String letter) => subLevelUseCase.isUsed(letter);

  @override
  bool wordContainLetter(String letter) {
    return subLevelUseCase.containLetter(letter);
  }

  @override
  void playAudio(String audioUrl) {
    AssetsAudioPlayer.newPlayer().open(
      Audio(audioUrl),
      autoStart: true,
      volume: 100,
    );
    update();
  }
}
