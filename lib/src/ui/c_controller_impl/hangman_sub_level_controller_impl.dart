import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';

class HangManSubLevelControllerImpl extends HangManSubLevelController {
  late final HangManSubLevelUseCase subLevelUseCase;

  HangManSubLevelControllerImpl({
    required HangManSubLevelDomain subLevelDomain,
  }) : subLevelUseCase = HangManSubLevelUseCaseImpl(
          subLevelDomain: subLevelDomain,
        );

  HangManSubLevelDomain get subLevelDomain => subLevelUseCase.subLevelDomain;

  @override
  String get answer => subLevelUseCase.subLevelDomain.answer;

  @override
  String get imageUrl => subLevelUseCase.subLevelDomain.urlImage;

  @override
  int get lives => subLevelUseCase.subLevelDomain.lives;

  @override
  int answerCantOfWords() {
    return answerSpellOut().length;
  }

  @override
  List<String> answerSpellOut() {
    List<String> answerList = [];
    answer.split("").forEach((element) => answerList.add(element));
    return answerList;
  }
}
