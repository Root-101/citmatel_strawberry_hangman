import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';

class HangManSubLevelControllerImpl extends HangManSubLevelController {
  late final HangManSubLevelUseCase subLevelUseCase;
  late final List<String> answerToBe;

  HangManSubLevelControllerImpl({
    required HangManSubLevelDomain subLevelDomain,
  }) : subLevelUseCase = HangManSubLevelUseCaseImpl(
          subLevelDomain: subLevelDomain,
        ) {
    answerToBe = List.generate(answerCantOfLetters(), (index) => "_");
  }

  @override
  String get imageUrl => subLevelUseCase.subLevelDomain.urlImage;

  @override
  int get lives => subLevelUseCase.subLevelDomain.lives;

  @override
  int answerCantOfLetters() => answerToBe.length;

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
    // TODO: implement breakHeart
  }

  void _fillAnswer(List<int> possiblesIndex, String letter) {
    possiblesIndex.forEach((index) {
      answerToBe[index] = letter;
    });
  }

  int keyboardColumns() => subLevelUseCase.keyboardColumns();

  List<String> keyboard() => subLevelUseCase.keyboard();
}
