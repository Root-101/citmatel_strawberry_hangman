import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';
import 'package:clean_core/clean_core.dart';

abstract class HangManSubLevelUseCase extends AbstractUseCase {
  HangManSubLevelDomain get subLevelDomain;

  int get answerCantOfLetters;

  int get keyboardCantLetters;

  //teclado
  List<String> get keyboard;

  //todas las posiciones donde esta la letra, si esta vacia es xq la letra no va
  List<int> checkLetter(String letter);

  //true si contiene la letra en al menos una posicion, si el checkLetter.length > 0
  bool containLetter(String letter);

  //no se usa como getter por si hay que ponerle logica despues con comodines que aumenten las vidas
  int lives();
}
