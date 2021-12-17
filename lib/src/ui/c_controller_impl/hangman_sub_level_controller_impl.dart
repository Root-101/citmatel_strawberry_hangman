import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';

class HangManSubLevelControllerImpl extends HangManSubLevelController {
  late final HangManSubLevelUseCase subLevelUseCase;
  late final List<String> answerToBe;

  HangManSubLevelControllerImpl({
    required HangManSubLevelDomain subLevelDomain,
  }) : subLevelUseCase = HangManSubLevelUseCaseImpl(
          subLevelDomain: subLevelDomain,
        ) {
    answerToBe = List.generate(answerSpellOut().length, (index) => "_");
  }

  HangManSubLevelDomain get subLevelDomain => subLevelUseCase.subLevelDomain;

  @override
  String get answer => subLevelUseCase.subLevelDomain.answer;

  @override
  String get imageUrl => subLevelUseCase.subLevelDomain.urlImage;

  @override
  int get lives => subLevelUseCase.subLevelDomain.lives;

  @override
  int answerCantOfWords() => subLevelUseCase.answerCantOfWords();

  @override
  List<String> answerSpellOut() => subLevelUseCase.answerSpellOut();

  @override
  int checkLetter(String text) {
    if (answerSpellOut().contains(text)) {
    }
    return -1;
  }

  @override
  void isLetterCorrect(String text) {
    int index = checkLetter(text);
    if (index == -1) {
      breakHeart();
    } else {
      fillAnswer(index);
    }
  }

  @override
  void breakHeart() {
    // TODO: implement breakHeart
  }

  @override
  void fillAnswer(int index) {
    answerToBe[index] = answerSpellOut().elementAt(index);
    update();
  }
}
