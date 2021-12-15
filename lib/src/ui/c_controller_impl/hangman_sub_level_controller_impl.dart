import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';

class HangManSubLevelControllerImpl extends HangManSubLevelController {
  late final HangManSubLevelUseCase subLevelUseCase;

  HangManSubLevelControllerImpl({
    required HangManSubLevelDomain subLevelDomain,
  }) : subLevelUseCase = HangManSubLevelUseCaseImpl(
          subLevelDomain: subLevelDomain,
        );
        
  HangManSubLevelDomain get subLevelDomain => subLevelUseCase.subLevelDomain;
}
