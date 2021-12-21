import 'dart:math';

import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';

class HangManSubLevelUseCaseImpl extends HangManSubLevelUseCase {
  final HangManSubLevelDomain subLevelDomain;

  ///letras de la respuesta
  late final List<String> answerLettersSpellOut;

  ///diferentes letras de la respuesta
  late final List<String> answerLettersDifferent;

  late final int keyboardCantLetters;
  late final List<String> keyboard;

  static const DEFAULT_KEYBOARD_COLUMNS = 6;
  static const MIN_CANT_LETTERS_KEYBOARD =
      2 * DEFAULT_KEYBOARD_COLUMNS; //min = 12
  static const MAX_CANT_LETTERS_KEYBOARD =
      4 * DEFAULT_KEYBOARD_COLUMNS; //max = 24

  HangManSubLevelUseCaseImpl({required this.subLevelDomain}) {
    answerLettersSpellOut = subLevelDomain.answer.toUpperCase().split("");
    answerLettersDifferent = answerLettersSpellOut.toSet().toList();
    keyboardCantLetters = _cantLettersKeyboard();
    keyboard = _generateKeyboard();
  }

  @override
  int get answerCantOfLetters => subLevelDomain.answer.length;

  @override
  int lives() {
    return subLevelDomain.lives;
  }

  @override
  List<int> checkLetter(String letter) {
    return letter
        .toUpperCase()
        .allMatches(
          subLevelDomain.answer.toUpperCase(),
        )
        .map((e) => e.start)
        .toList();
  }

  @override
  bool containLetter(String letter) {
    return checkLetter(letter).isNotEmpty;
  }

  List<String> _generateKeyboard() {
    //cojo todas las letras
    List<String> allLetters =
        "abcdefghijklmnñopqrstuvwxyz".toUpperCase().split("");

    //quito las que ya están en la respuesta
    allLetters
        .removeWhere((element) => answerLettersDifferent.contains(element));

    //las vuelvo aleatorias
    allLetters.shuffle();

    //cojo las que necesito para completar el teclado
    int faltan = keyboardCantLetters - answerLettersDifferent.length;

    //creo finalmente la lista del teclado
    List<String> keyboard = [];
    //agrego las originales
    keyboard.addAll(answerLettersDifferent);
    //agrego las extras
    keyboard.addAll(allLetters.sublist(0, faltan));
    //lo mexclo de nuevo
    keyboard.shuffle();

    //lo limpio de nuevo para si por si acaso, no puede reducirse
    keyboard = keyboard.toSet().toList();

    return keyboard;
  }

  int _cantLettersKeyboard() {
    int real = answerLettersDifferent.length + DEFAULT_KEYBOARD_COLUMNS;
    if (real < MIN_CANT_LETTERS_KEYBOARD) {
      return MIN_CANT_LETTERS_KEYBOARD;
    } else if (real > MAX_CANT_LETTERS_KEYBOARD) {
      return MAX_CANT_LETTERS_KEYBOARD;
    } else {
      return 18; //middle
    }
  }
}
