import 'dart:math';

import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';

class HangManSubLevelUseCaseImpl extends HangManSubLevelUseCase {
  final HangManSubLevelDomain subLevelDomain;

  ///letras de la respuesta
  late final List<String> answerLettersSpellOut;

  ///diferentes letras de la respuesta
  late final List<String> answerLettersDifferent;

  late final List<String> keyboard;
  late final int keyboardColumns;

  static const DEFAULT_KEYBOARD_COLUMNS = 6;
  static const MIN_CANT_LETTERS_KEYBOARD =
      2 * DEFAULT_KEYBOARD_COLUMNS; //min = 12
  static const MAX_CANT_LETTERS_KEYBOARD =
      4 * DEFAULT_KEYBOARD_COLUMNS; //max = 24

  HangManSubLevelUseCaseImpl({required this.subLevelDomain}) {
    keyboardColumns = _generateKeyboardColumns();
    keyboard = _generateKeyboard();
    answerLettersSpellOut = subLevelDomain.answer.split("");
    answerLettersDifferent = _clearDuplicates(answerLettersSpellOut);
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

  int _generateKeyboardColumns() {
    return DEFAULT_KEYBOARD_COLUMNS;
  }

  List<String> _generateKeyboard() {
    return "HELOUIQWERTY".split("");

    //busco la cantidad de letras que va a tener, simpre multiplo de `keyboardColumns()`
    int cantLetters = _cantLettersKeyboard();

    //cojo todas las letras
    List<String> allLetters = "abcdefghijklmnopqrstuvwxyz".split("");

    //quito las que ya están en la respuesta
    allLetters
        .removeWhere((element) => answerLettersDifferent.contains(element));

    //las vuelvo aleatorias
    allLetters.shuffle();

    //cojo las que necesito para completar el teclado
    int faltan = cantLetters - answerLettersDifferent.length;

    //creo finalmente la lista del teclado
    List<String> keyboard = [];
    //agrego las originales
    keyboard.addAll(answerLettersDifferent);
    //agrego las extras
    keyboard.addAll(
      List.generate(faltan, (index) => allLetters[index]),
    );
    //lo mexclo de nuevo
    keyboard.shuffle();

    //lo limpio de nuevo para si por si acaso, no puede reducirse
    keyboard = _clearDuplicates(keyboard);
    if (keyboard.length % keyboardColumns != 0) {
      keyboard = List.generate(cantLetters, (index) => "Error");
    }

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

  List<String> _clearDuplicates(List<String> list) {
    Map<String, bool> duplicateMap = {};
    List<String> cleanList = [];
    list.forEach(
      (element) {
        //no duplicado
        if (duplicateMap[element] == false) {
          cleanList.add(element);
          duplicateMap[element] = true;
        } else {
          //esta duplicado
        }
      },
    );

    return cleanList;
  }
}
