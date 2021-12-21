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
  static const MID_CANT_LETTERS_KEYBOARD =
      3 * DEFAULT_KEYBOARD_COLUMNS; //min = 18
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
    // de [1  ...  6]     =>  12
    // de [7  ... 12]    =>  18
    // de [13 ... 23]    =>  24
    // mas de 24       =>  ERROR
    if (answerLettersDifferent.length <= DEFAULT_KEYBOARD_COLUMNS) {
      return MIN_CANT_LETTERS_KEYBOARD;
    } else if (answerLettersDifferent.length <= MIN_CANT_LETTERS_KEYBOARD) {
      return MID_CANT_LETTERS_KEYBOARD; //super error si se llega aqui
    } else if (answerLettersDifferent.length > MID_CANT_LETTERS_KEYBOARD &&
        answerLettersDifferent.length < MAX_CANT_LETTERS_KEYBOARD) {
      return MAX_CANT_LETTERS_KEYBOARD; //middle
    } else {
      throw Exception("Muchas letras en la palabra");
    }
  }
}
