import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';
import 'package:clean_core/clean_core.dart';

abstract class HangManSubLevelUseCase extends AbstractUseCase {
  HangManSubLevelDomain get subLevelDomain;

  List<String> answerSpellOut();
  int answerCantOfWords();

  int checkLetter(String text);

  int keyboardColumns();
  List<String> keyboard();
}
