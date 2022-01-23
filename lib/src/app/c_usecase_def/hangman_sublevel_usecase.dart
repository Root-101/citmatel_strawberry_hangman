import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';
import 'package:clean_core/clean_core.dart';

abstract class HangManSubLevelUseCase extends AbstractUseCase {
  ///domain almacenado para acceder a la info
  HangManSubLevelDomain get subLevelDomain;

  ///cantidad de letras de la respuesta, para saber las columnas de la visual
  ///en teoría debería cambiar para una lista para soportar respuestas de varias palabras
  int get answerCantOfLetters;

  ///cantidad de letras del teclado
  int get keyboardCantLetters;

  ///teclado como tal que se muestra, se debe asegurar que no tenga letras repetidas y siempre contenga las letras de la respuesta
  List<String> get keyboard;

  ///todas las posiciones donde esta la letra, si esta vacia es xq la letra no va
  ///ademas marca la letra como usada
  List<int> checkLetter(String letter);

  ///true si la letra ya se uso
  bool isUsed(String letter);

  ///true si contiene la letra en al menos una posicion, si el checkLetter.length > 0
  bool answerContainLetter(String letter);

  ///cantidad de vidas maximas del nivel
  ///no se usa como getter por si hay que ponerle logica despues con comodines que aumenten las vidas
  int lives();

  void saveProgress(int stars);

  bool showTutorial();
}
