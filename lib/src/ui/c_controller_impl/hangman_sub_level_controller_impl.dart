import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';

class HangManSubLevelControllerImpl extends HangManSubLevelController {
  late final HangManSubLevelUseCase subLevelUseCase;
  late final List<String> answerToBe;
  int remainingLives = 0;

  HangManSubLevelControllerImpl({
    required HangManSubLevelDomain subLevelDomain,
  }) : subLevelUseCase = HangManSubLevelUseCaseImpl(
          subLevelDomain: subLevelDomain,
        ) {
    remainingLives = subLevelUseCase.lives();
    answerToBe = List.generate(answerCantOfLetters(), (index) => "_");
  }

  @override
  String get imageUrl => subLevelUseCase.subLevelDomain.urlImage;

  @override
  int get lives => subLevelUseCase.subLevelDomain.lives;

  @override
  int answerCantOfLetters() => subLevelUseCase.answerCantOfLetters();

  @override
  void checkLetter(String letter) {
    List<int> possiblesIndex = subLevelUseCase.checkLetter(letter);
    if (possiblesIndex.isEmpty) {
      //no existe esa letra en la palabra
      _breakHeart();
    } else {
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

  int keyboardColumns() => subLevelUseCase.keyboardColumns();

  List<String> keyboard() => subLevelUseCase.keyboard();
}
